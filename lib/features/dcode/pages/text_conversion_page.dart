import 'package:dcode/features/dcode/bloc/dcode_bloc.dart';
import 'package:dcode/features/dcode/util/config.dart';
import 'package:dcode/features/dcode/widgets/dcode_drawer.dart';
import 'package:dcode/features/dcode/widgets/decode_text_field_widget.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/dropdown_text_conversion_widget.dart';
import '../widgets/encode_text_field_widget.dart';
import 'package:flutter/material.dart';

class TextConversionPage extends StatelessWidget {
  static const textConvertionRoute = '/text_conversion_page';

  Widget makeDismissable({
    @required Widget child,
    @required BuildContext context,
  }) =>
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(onTap: () {}, child: child),
      );

  Widget _buildSheet(BuildContext context) {
    return makeDismissable(
      child: DraggableScrollableSheet(
        initialChildSize: 1,
        maxChildSize: 1,
        minChildSize: 0.7,
        builder: (_, controller) => Container(

          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: ListView(
            controller: controller,
            children: [
              SizedBox(
                height: 8,
              ),
              Text(
                sheetInfo.entries.first.key,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.blue),
              ),
              SizedBox(
                height: 15,
              ),
              Text(sheetInfo.entries.first.value),
            ],
          ),
        ),
      ),
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
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
                builder: (context) => _buildSheet(context),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
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
            ),
          ],
        ),
      ),
    );
  }
}
