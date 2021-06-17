import 'package:dcode/features/dcode/bloc/dcode_bloc.dart';
import 'package:dcode/features/dcode/util/config.dart';
import 'package:dcode/features/dcode/widgets/dcode_drawer.dart';
import 'package:dcode/features/dcode/widgets/decode_text_field_widget.dart';
import 'package:dcode/features/dcode/widgets/dropdown_text_hash_widget.dart';
import 'package:dcode/features/dcode/widgets/encode_text_field_widget.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: Text('Text Hashing'),
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
