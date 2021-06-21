import 'package:clipboard/clipboard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:share/share.dart';
import '../bloc/dcode_bloc.dart';
import 'package:flutter/material.dart';
import '../util/config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DecodeTextFieldWidget extends StatefulWidget {
  final DcodeBloc dcodeBloc;

  final String textHint;

  final Function({@required String value}) configs;
  final Function({@required Function function}) clear;
  final Function copy;

  const DecodeTextFieldWidget({
    this.textHint,
    this.configs,
    this.dcodeBloc,
    this.copy,
    this.clear,
  });

  @override
  _DecodeTextFieldWidgetState createState() => _DecodeTextFieldWidgetState();
}

class _DecodeTextFieldWidgetState extends State<DecodeTextFieldWidget> {
  TextEditingController _encodeController;
  var val;

  @override
  void initState() {
    _encodeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                IconButton(
                  onPressed: () async {
                    if (_encodeController.text.isNotEmpty) {
                      await FlutterClipboard.copy(_encodeController.text);
                    }
                  },
                  icon: FaIcon(FontAwesomeIcons.copy),
                  iconSize: 20,
                ),
                IconButton(
                  onPressed: () async {
                    widget.configs(value: await FlutterClipboard.paste());
                    widget.dcodeBloc.add(encode);
                    _encodeController.text = await FlutterClipboard.paste();
                  },
                  icon: FaIcon(FontAwesomeIcons.clipboard),
                  iconSize: 20,
                ),
                IconButton(
                  onPressed: () {
                    if (_encodeController.text.isNotEmpty) {
                      Share.share(_encodeController.text);
                    }
                  },
                  icon: FaIcon(FontAwesomeIcons.shareAlt),
                  iconSize: 20,
                ),
                IconButton(
                  onPressed: () {
                    _encodeController.clear();
                    widget.dcodeBloc.add(ClearEncoded());
                  },
                  icon: FaIcon(FontAwesomeIcons.trashAlt),
                  iconSize: 20,
                ),
              ],
            ),
          ),
          BlocBuilder<DcodeBloc, DcodeState>(
            builder: (context, state) {
              if (state is Decoded) {
                _encodeController.text = state.decoded;
              }
              return Expanded(
                child: TextField(
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                  ),
                  expands: true,
                  maxLines: null,
                  minLines: null,
                  controller: _encodeController,
                  onChanged: (value) {
                    val = value;
                    widget.configs(value: value);
                    widget.dcodeBloc.add(encode);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: widget.textHint,
                    filled: true,
                    isCollapsed: true,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 8,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
