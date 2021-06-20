import 'package:dcode/features/dcode/widgets/dcode_bottom_sheet.dart';

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
        title: Text('Text Hashing'),
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
                  title: sheetInfoHash.entries.first.key,
                  text: sheetInfoHash.entries.first.value,
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
