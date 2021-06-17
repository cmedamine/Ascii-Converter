import 'package:dcode/features/dcode/bloc/dcode_bloc.dart';
import 'package:dcode/features/dcode/pages/text_conversion_page.dart';
import 'package:dcode/features/dcode/pages/text_hash_page.dart';
import 'package:dcode/features/dcode/util/config.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DcodeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final clearEncoded = BlocProvider.of<DcodeBloc>(context);
    final clearDecoded = BlocProvider.of<DcodeBloc>(context);

    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          ListTile(
            leading: Icon(
              Icons.sync_sharp,
              size: 32,
            ),
            title: Text(
              'Text conversion',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                TextConversionPage.textConvertionRoute,
              );
              textConvertionMenuItem = TextConvertionMenuItems.Binary;
              clearDecoded.add(ClearDecoded());
              clearEncoded.add(ClearEncoded());
            },
          ),
          ListTile(
            leading: Icon(
              Icons.tag_sharp,
              size: 32,
            ),
            title: Text(
              'Hash',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                TextHashPage.textHashRoute,
              );
              textHashMenuItem = TextHashMenuItems.SHA1;
              clearDecoded.add(ClearDecoded());
              clearEncoded.add(ClearEncoded());
            },
          ),
        ],
      ),
    );
  }
}
