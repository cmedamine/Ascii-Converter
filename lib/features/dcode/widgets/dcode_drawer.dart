import 'package:dcode/features/dcode/pages/about_page.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import '../bloc/dcode_bloc.dart';
import '../pages/text_conversion_page.dart';
import '../pages/text_hash_page.dart';
import '../util/config.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DcodeDrawer extends StatefulWidget {
  const DcodeDrawer({Key key}) : super(key: key);

  @override
  _DcodeDrawerState createState() => _DcodeDrawerState();
}

class _DcodeDrawerState extends State<DcodeDrawer> {
  final myAppLink =
      'http://www.amazon.com/gp/mas/dl/android?p=com.nimbleapps.asciiconverter';

  List<Color> colorList = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow
  ];
  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];
  int index = 0;
  Color bottomColor = Colors.red;
  Color topColor = Colors.yellow;
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;

  Future<void> startAnimation;

  @override
  void initState() {
    super.initState();
    startAnimation = Future.delayed(
      const Duration(milliseconds: 10),
      () {
        setState(() {
          bottomColor = Colors.blue;
        });
      },
    );
  }

  @override
  void dispose() {
    startAnimation = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final clearEncoded = BlocProvider.of<DcodeBloc>(context);
    final clearDecoded = BlocProvider.of<DcodeBloc>(context);

    return Drawer(
      child: Column(
        children: [
          AnimatedContainer(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 4,
            duration: Duration(seconds: 2),
            onEnd: () {
              setState(
                () {
                  index = index + 1;
                  // animate the color
                  bottomColor = colorList[index % colorList.length];
                  topColor = colorList[(index + 1) % colorList.length];

                  // animate the alignment
                  // begin = alignmentList[index % alignmentList.length];
                  // end = alignmentList[(index + 2) % alignmentList.length];
                },
              );
            },
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: begin,
                end: end,
                colors: [bottomColor, topColor],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '⚡ Powered By Nimble Apps',
                    style: TextStyle(
                      fontSize: 18.0,
                      // fontWeight: FontWeight.bold,
                      fontFamily: 'DMSans',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Container(
          //   height: MediaQuery.of(context).size.height / 4,
          //   width: double.infinity,
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       begin: Alignment.topRight,
          //       end: Alignment.bottomLeft,
          //       stops: [
          //         0.0,
          //         1,
          //       ],
          //       colors: [
          //         Colors.indigo,
          //         Colors.teal,
          //       ],
          //     ),
          //   ),
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          //     child: Column(
          //       crossAxisAlignment:  CrossAxisAlignment.start,
          //       mainAxisAlignment: MainAxisAlignment.end,
          //       children: [
          //         Text(
          //           'Powered By Nimble Apps',
          //           style: TextStyle(
          //             fontSize: 18.0,
          //             // fontWeight: FontWeight.bold,
          //             color: Colors.white,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.sync,
            ),
            title: Text(
              'Text conversion',
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    fontFamily: 'DMSans',
                  ),
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
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.hashtag,
            ),
            title: Text(
              'Hash',
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    fontFamily: 'DMSans',
                  ),
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
          Divider(),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.shareAlt,
            ),
            title: Text(
              'Share this app',
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    fontFamily: 'DMSans',
                  ),
            ),
            onTap: () async {
              await Share.share(myAppLink);
            },
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.star,
            ),
            title: Text(
              'Rate this app',
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    fontFamily: 'DMSans',
                  ),
            ),
            onTap: () async {
              if (await canLaunch(myAppLink))
                await launch(myAppLink);
              else
                throw "Could not launch $myAppLink";
            },
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.infoCircle,
            ),
            title: Text(
              'Help & About',
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    fontFamily: 'DMSans',
                  ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(AboutPage.route);
            },
          ),
        ],
      ),
    );
  }
}
