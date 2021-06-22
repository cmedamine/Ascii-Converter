import 'package:clipboard/clipboard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:share/share.dart';
import '../bloc/dcode_bloc.dart';
import 'package:flutter/material.dart';
import '../util/config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EncodeTextFieldWidget extends StatefulWidget {
  final bool isOn;
  final DcodeBloc dcodeBloc;
  final String textHint;
  final Function({@required String value}) configs;

  const EncodeTextFieldWidget({
    this.textHint,
    this.configs,
    this.dcodeBloc,
    this.isOn = true,
  });

  @override
  _DcodeTextFieldWidgetState createState() => _DcodeTextFieldWidgetState();
}

class _DcodeTextFieldWidgetState extends State<EncodeTextFieldWidget> {
  var val;
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
    return Expanded(
      child: Row(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                IconButton(
                  onPressed: () async {
                    if (_decodeController.text.isNotEmpty) {
                      await FlutterClipboard.copy(_decodeController.text);
                    }
                  },
                  icon: FaIcon(FontAwesomeIcons.copy),
                  iconSize: 20,
                ),
                !widget.isOn
                    ? Container()
                    : IconButton(
                        onPressed: () async {
                          widget.configs(value: await FlutterClipboard.paste());
                          widget.dcodeBloc.add(decode);
                          _decodeController.text =
                              await FlutterClipboard.paste();
                        },
                        icon: FaIcon(FontAwesomeIcons.clipboard),
                        iconSize: 20,
                      ),
                IconButton(
                  onPressed: () {
                    if (_decodeController.text.isNotEmpty) {
                      Share.share(_decodeController.text);
                    }
                  },
                  icon: FaIcon(FontAwesomeIcons.shareAlt),
                  iconSize: 20,
                ),
                IconButton(
                  onPressed: () {
                    _decodeController.clear();
                    widget.dcodeBloc.add(ClearDecoded());
                  },
                  icon: FaIcon(FontAwesomeIcons.trashAlt),
                  iconSize: 20,
                ),
              ],
            ),
          ),
          BlocBuilder<DcodeBloc, DcodeState>(
            builder: (context, state) {
              if (state is Encoded) {
                _decodeController.text = state.encoded;
              }
              return Expanded(
                child: TextField(
                  expands: true,
                  maxLines: null,
                  minLines: null,
                  controller: _decodeController,
                  onChanged: (value) {
                    val = value;
                    if (widget.isOn) {
                      widget.configs(value: value);
                      widget.dcodeBloc.add(decode);
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: widget.textHint,
                    filled: true,
                    isCollapsed: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16, horizontal: 8),
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
