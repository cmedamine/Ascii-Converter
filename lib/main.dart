
import 'package:dcode/features/dcode/bloc/dcode_bloc.dart';
import 'package:dcode/features/dcode/pages/text_hash_page.dart';
// import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/dcode/pages/text_conversion_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await DesktopWindow.setMinWindowSize(Size(380, 700));
  // await DesktopWindow.setMaxWindowSize(Size(380, 700));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DcodeBloc(),
      child: MaterialApp(
        title: 'Material App',
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        debugShowCheckedModeBanner: false,
        home: TextConversionPage(),
        routes: {
          TextConversionPage.textConvertionRoute: (ctx) => TextConversionPage(),
          TextHashPage.textHashRoute: (ctx) => TextHashPage(),
        },
      ),
      
    );
  }
}