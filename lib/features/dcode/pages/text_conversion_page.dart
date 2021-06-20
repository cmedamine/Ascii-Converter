import 'package:dcode/features/dcode/pages/text_hash_page.dart';
import 'package:dcode/features/dcode/widgets/dcode_bottom_sheet.dart';

import '../bloc/dcode_bloc.dart';
import '../util/config.dart';
import '../widgets/dcode_drawer.dart';
import '../widgets/decode_text_field_widget.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_provider/theme_provider.dart';
import '../widgets/dropdown_text_conversion_widget.dart';
import '../widgets/encode_text_field_widget.dart';
import 'package:flutter/material.dart';

//TODO add three dots: change theme, rating app, remove ads
class TextConversionPage extends StatefulWidget {
  static const textConvertionRoute = '/text_conversion_page';

  static final String customAppThemeId = 'custom_theme';

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
            icon: Icon(Icons.info_outlined),
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
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                child: GestureDetector(
                  onTap: () async {
                    Navigator.of(context).pop();
                    await showDialog(
                      context: context,
                      builder: (_) => ThemeDialog(
                        hasDescription: false,
                        innerCircleColorBuilder: (AppTheme theme) {
                          return theme.data.accentColor;
                        },
                        outerCircleColorBuilder: (AppTheme theme) {
                          return theme.data.accentColor;
                        },
                      ),
                    );
                  },
                  child: ListTile(
                    leading: Icon(
                      controller.theme.id == 'dark'
                          ? Icons.brightness_2
                          : Icons.brightness_2_outlined,
                    ),
                    title: Text('Select Theme'),
                  ),
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.rate_review_sharp),
                  title: Text('rate us'),
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.ad_units_sharp),
                  title: Text('Remove ads'),
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.share_sharp),
                  title: Text('Share this app'),
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: DcodeDrawer(),
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
