import 'package:dcode/features/dcode/widgets/dcode_bottom_sheet.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rate_my_app/rate_my_app.dart';

import '../bloc/dcode_bloc.dart';
import '../util/config.dart';
import '../widgets/dcode_drawer.dart';
import '../widgets/decode_text_field_widget.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_provider/theme_provider.dart';
import '../widgets/dropdown_text_conversion_widget.dart';
import '../widgets/encode_text_field_widget.dart';
import 'package:flutter/material.dart';

class TextConversionPage extends StatefulWidget {
  static const textConvertionRoute = '/text_conversion_page';

  final RateMyApp rateMyApp;

  const TextConversionPage({Key key, this.rateMyApp}) : super(key: key);
  @override
  _TextConversionPageState createState() => _TextConversionPageState();
}

class _TextConversionPageState extends State<TextConversionPage> {
  @override
  Widget build(BuildContext context) {
    var controller = ThemeProvider.controllerOf(context);
    final bloc = BlocProvider.of<DcodeBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Text Conversion'),
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.lightbulb),
            onPressed: () {
              showModalBottomSheet(
                //REVIEW fix modal sheet shows keyboard after closing.
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                builder: (context) => DcodeBottomSheet(
                  title: sheetInfoText.entries.first.key,
                  text: sheetInfoText.entries.first.value,
                ),
              );
            },
          ),
          IconButton(
            onPressed: () {
              controller.nextTheme();
            },
            icon: FaIcon(
              controller.theme.id == 'light'
                  ? FontAwesomeIcons.moon
                  : FontAwesomeIcons.solidMoon,
            ),
          ),
        ],
      ),
      drawer: DcodeDrawer(rateMyApp: widget.rateMyApp,),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 8, 16),
        child: Column(
          children: [
            DropDownTextConversionWidget(),
            SizedBox(height: 10),
            DecodeTextFieldWidget(
              dcodeBloc: bloc,
              textHint: 'Enter text to encode...',
              configs: ({value}) {
                setTextConversionConfig(
                  decodeText: value,
                  textConvertionMenuItem: textConvertionMenuItem,
                );
              },
            ),
            SizedBox(height: 10),
            EncodeTextFieldWidget(
              dcodeBloc: bloc,
              textHint: 'Enter text to decode...',
              configs: ({value}) {
                setTextConversionConfig(
                  encodeText: value,
                  textConvertionMenuItem: textConvertionMenuItem,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
