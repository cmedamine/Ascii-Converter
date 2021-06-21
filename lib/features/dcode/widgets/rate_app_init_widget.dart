import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';

class RateAppInitWidget extends StatefulWidget {
  final Widget Function(RateMyApp) builder;

  const RateAppInitWidget({
    Key key,
    @required this.builder,
  }) : super(key: key);

  @override
  _RateAppInitWidgetState createState() => _RateAppInitWidgetState();
}

class _RateAppInitWidgetState extends State<RateAppInitWidget> {
  static const playStoreId = 'com.android.chrome';
  RateMyApp rateMyApp;

  @override
  Widget build(BuildContext context) {
    return RateMyAppBuilder(
      rateMyApp: RateMyApp(
        googlePlayIdentifier: playStoreId,
        minLaunches: 2,
        minDays: 2,
        remindDays: 1,
        remindLaunches: 1
      ),
      onInitialized: (context, rateMyApp) {
        setState(() {
          this.rateMyApp = rateMyApp;

          if(rateMyApp.shouldOpenDialog) {
            rateMyApp.showStarRateDialog(context);
          }
        });
      },
      builder: (context) => rateMyApp == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : widget.builder(rateMyApp),
    );
  }
}
