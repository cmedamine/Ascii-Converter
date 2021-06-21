import 'package:dcode/features/dcode/pages/about_page.dart';
import 'package:rate_my_app/rate_my_app.dart';

import '../bloc/dcode_bloc.dart';
import '../pages/text_conversion_page.dart';
import '../pages/text_hash_page.dart';
import '../util/config.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DcodeDrawer extends StatefulWidget {
  final RateMyApp rateMyApp;

  const DcodeDrawer({Key key, this.rateMyApp}) : super(key: key);

  @override
  _DcodeDrawerState createState() => _DcodeDrawerState();
}

class _DcodeDrawerState extends State<DcodeDrawer> {
  List<Widget> actionsBuidler(BuildContext context, double stars) =>
      stars == null
          ? [buildCancelButton()]
          : [
              buildOkButton(stars),
              buildCancelButton(),
            ];

  Widget buildOkButton(double stars) => TextButton(
        child: Text('OK'),
        onPressed: () async {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Thanks for your feedback!🙏'),
            ),
          );

          final event = RateMyAppEventType.rateButtonPressed;
          await widget.rateMyApp.callEvent(event);
          //REVIEW stars might be 3 or higher!
          bool launchPlayStore = stars >= 4;

          if (launchPlayStore) {
            widget.rateMyApp.launchStore();
          }

          Navigator.of(context).pop();
        },
      );

  Widget buildCancelButton() => RateMyAppNoButton(
        widget.rateMyApp,
        text: 'CANCEL',
      );

  TextEditingController _commentController;

  Widget buildComment(BuildContext context) => TextFormField(
        controller: _commentController,
        maxLines: 3,
        autofocus: true,
        onFieldSubmitted: (_) => Navigator.of(context).pop(),
        decoration: InputDecoration(
            hintText: 'Write Comment...', border: OutlineInputBorder()),
        onChanged: (value) {
          _commentController.text = value;
        },
      );

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
    _commentController = TextEditingController();
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
    _commentController.dispose();
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
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.hashtag,
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
          Divider(),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.shareAlt,
            ),
            title: Text(
              'Share this app',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.star,
            ),
            title: Text(
              'rate us',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            onTap: () {
              widget.rateMyApp.showStarRateDialog(
                context,
                title: '🌟 Rate This App',
                message: 'Do you like this app? Please leave a rating.',
                starRatingOptions: StarRatingOptions(
                  initialRating: 4,
                ),
                // contentBuilder: (context, _) => buildComment(context),//NOTE this is optional for adding comment
                actionsBuilder: actionsBuidler,
              );
            },
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.ad,
            ),
            title: Text(
              'Remove ads',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.infoCircle,
            ),
            title: Text(
              'Help & About',
              style: Theme.of(context).textTheme.subtitle1,
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
