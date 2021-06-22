import 'package:dcode/features/dcode/widgets/dcode_bottom_sheet.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../bloc/dcode_bloc.dart';
import '../util/config.dart';
import '../widgets/dcode_drawer.dart';
import '../widgets/decode_text_field_widget.dart';
import '../widgets/dropdown_text_hash_widget.dart';
import '../widgets/encode_text_field_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_provider/theme_provider.dart';

class TextHashPage extends StatefulWidget {
  static const textHashRoute = '/text_hash_page';

  @override
  _TextHashPageState createState() => _TextHashPageState();
}

class _TextHashPageState extends State<TextHashPage> {
  TextEditingController _decodeController;

  @override
  void initState() {
    _decodeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _decodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<DcodeBloc>(context);
    var controller = ThemeProvider.controllerOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Text Hashing',
          style: TextStyle(fontFamily: 'DMSans'),
        ),
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
                  title: sheetInfoHash.entries.first.key,
                  text: sheetInfoHash.entries.first.value,
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
      drawer: DcodeDrawer(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 8, 16),
        child: Column(
          children: [
            DropDownTextHashWidget(),
            SizedBox(height: 10),
            DecodeTextFieldWidget(
              dcodeBloc: bloc,
              textHint: 'Enter text to encrypt...',
              configs: ({value}) {
                setTextHashConfig(
                  decodeText: value,
                  textHashMenuItem: textHashMenuItem,
                );
              },
            ),
            SizedBox(height: 10),
            EncodeTextFieldWidget(
              dcodeBloc: bloc,
              textHint: 'Encrypted',
              isOn: false,
              configs: ({value}) {
                setTextHashConfig(
                  decodeText: value,
                  textHashMenuItem: textHashMenuItem,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
