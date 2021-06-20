import '../bloc/dcode_bloc.dart';
import '../pages/text_conversion_page.dart';
import '../pages/text_hash_page.dart';
import '../util/config.dart';

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
            height: 70,
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
              sheetInfoText = binInfo;
              clearDecoded.add(ClearDecoded());
              clearEncoded.add(ClearEncoded());
            },
          ),
          Divider(
            height: 1,
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
          Divider(
            height: 1,
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              size: 32,
            ),
            title: Text(
              'About this app',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            onTap: () {
              
            },
          ),
        ],

      ),
    );
  }
}
