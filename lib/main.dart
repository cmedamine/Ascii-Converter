import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await DesktopWindow.setMinWindowSize(Size(380, 700));
  // await DesktopWindow.setMaxWindowSize(Size(380, 700));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _value = 1;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dcode'),),
      drawer: Drawer(),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            for (int i = 1; i <= 10; i++)
              ListTile(
                title: Text(
                  'Radio $i',
                ),
                leading: Radio(
                  value: i,
                  groupValue: _value,
                  onChanged: i == 9 ? null : (int value) {
                    setState(() {
                      _value = value;
                    });
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}