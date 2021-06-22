import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  static const route = '/about_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About',
          style: TextStyle(fontFamily: 'DMSans'),
        ),
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
                            style:
                                Theme.of(context).textTheme.headline6.copyWith(
                                      fontFamily: 'DMSans',
                                    ),
                          ),
                          Text(
                            'Nimble Apps',
                            style:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      fontFamily: 'DMSans',
                                    ),
                          ),
                          Text(
                            '1.0.0',
                            style:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      fontFamily: 'DMSans',
                                    ),
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

  ASCII Converter is about a complete set of text formatting tools for you, as well as many other tools, including converting text to ascii, Hex, Binary, encryption and much more!. 

You can do whatever you want with the text you're working on right here, I hope you enjoy this app.''',
                    style: TextStyle(
                      fontFamily: 'DMSans',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
