import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';

class AboutPage extends StatelessWidget {
  static const route = '/about_page';
  final RateMyApp rateMyApp;

  const AboutPage({Key key, this.rateMyApp}) : super(key: key);


  List<Widget> actionsBuidler(BuildContext context, double stars) =>
      stars == null
          ? [buildCancelButton()]
          : [buildOkButton(), buildCancelButton(),];

  Widget buildOkButton() => RateMyAppRateButton(
        rateMyApp,
        text: 'OK',
      );

  Widget buildCancelButton() => RateMyAppNoButton(
        rateMyApp,
        text: 'CANCEL',
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              child: Card(
                margin: EdgeInsets.all(0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image(
                            image: AssetImage(
                              'assets/icons/app_icon.png',
                            ),
                            height: 65,
                            width: 65,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ASCII Converter',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            'Nimble Apps',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          Text(
                            '1.0.0',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Card(
                margin: EdgeInsets.all(0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 12,
                  ),
                  child: Text(
                    '''Welcom to ASCII Converter app

  ASCII Converter is about a complete set of text formatting tools for you, as well as many other tools, 
including converting text to ascii, Hex, Binary, encryption and much more!. 

You can do whatever you want with the text you're working on right here.''',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Card(
                margin: EdgeInsets.all(0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        child: Text(
                          'Rate and review',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        onTap: () {
                          rateMyApp.showStarRateDialog(
                            context,
                            title: '🌟 Rate This App',
                            message:
                                'Do you like this app? Please leave a rating.',
                            starRatingOptions: StarRatingOptions(
                              initialRating: 4,
                            ),
                            actionsBuilder: actionsBuidler,
                          );
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Send feedback',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Share this app',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
