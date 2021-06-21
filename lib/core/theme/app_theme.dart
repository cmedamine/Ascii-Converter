import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

const Color dcodeWhite = Color(0xFFF0F6FC);
const Color dcodeGray = Color(0xFFC9D1D9);
const Color dcodeGray100 = Color(0xFF8b949e);
const Color dcodeDark50 = Color(0xFF21262d);
const Color dcodeDark100 = Color(0xFF161B22);
const Color dcodeDark200 = Color(0xFF0D1117);
const Color dcodeErrorRed = Color(0xFFf85149);
const Color dcodeBlue50 = Color(0xFF0096FF);
const Color dcodeBlue100 = Color(0xFF1f6feb);
const Color dcodeTeal50 = Color(0xFF5EBEBD);
const Color dcodeTeal100 = Color(0xFF4499A3);
const defaultLetterSpacing = 0.03;

const ColorScheme _dcodeDarkColorScheme = ColorScheme(
  primary: dcodeBlue50,
  primaryVariant: dcodeBlue100,
  secondary: dcodeTeal50,
  secondaryVariant: dcodeTeal100,
  surface: dcodeDark100,
  background: dcodeDark100,
  error: dcodeErrorRed,
  onPrimary: dcodeWhite,
  onSecondary: dcodeDark200,
  onSurface: dcodeGray,
  onBackground: dcodeGray100,
  onError: dcodeWhite,
  brightness: Brightness.dark,
);

ThemeData buildDcodeDarkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    colorScheme: _dcodeDarkColorScheme,
    toggleableActiveColor: dcodeBlue50,
    accentColor: dcodeDark200,
    primaryColor: dcodeDark200,
    buttonColor: dcodeBlue50,
    scaffoldBackgroundColor: dcodeDark100,
    
    appBarTheme: AppBarTheme(elevation: 0.0),
    canvasColor: dcodeDark100,
    cardColor: dcodeDark50,
    textSelectionTheme: TextSelectionThemeData(
      
      selectionColor: dcodeBlue50,
      cursorColor: dcodeBlue50,
      selectionHandleColor: dcodeBlue50,
    ),
    errorColor: dcodeErrorRed,
    buttonTheme: const ButtonThemeData(
      colorScheme: _dcodeDarkColorScheme,
      textTheme: ButtonTextTheme.normal,
    ),
    primaryIconTheme: _customDcodeDarkIconTheme(base.iconTheme),
    textTheme: _buildDcodeDarkTextTheme(base.textTheme),
    primaryTextTheme: _buildDcodeDarkTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildDcodeDarkTextTheme(base.accentTextTheme),
    iconTheme: _customDcodeDarkIconTheme(base.iconTheme),
  );
}

IconThemeData _customDcodeDarkIconTheme(IconThemeData original) {
  return original.copyWith(color: dcodeGray);
}

TextTheme _buildDcodeDarkTextTheme(TextTheme base) {
  return base
      .copyWith(
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
        button: base.button.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
      )
      .apply(
        fontFamily: 'SourceSansPro',
        displayColor: dcodeGray,
        bodyColor: dcodeGray,
      );
}

AppTheme githubDarkTheme({@required String id}) {
  return AppTheme(
    id: id,
    description: "",
    data: buildDcodeDarkTheme(),
  );
}

//-------------------------------------------------------------------------

const ColorScheme _dcodeLightColorScheme = ColorScheme(
  primary: dcodeBlue100,
  primaryVariant: dcodeDark100,
  secondary: dcodeTeal50,
  secondaryVariant: dcodeTeal100,
  surface: Colors.white,
  background: Colors.white,
  error: dcodeErrorRed,
  onPrimary: Colors.white,
  onSecondary: dcodeDark200,
  onSurface: dcodeDark200,
  onBackground: dcodeDark200,
  onError: Colors.white,
  brightness: Brightness.light,
);

ThemeData buildDcodeLightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: _dcodeLightColorScheme,
    toggleableActiveColor: dcodeBlue50,
    accentColor: Colors.white,
    primaryColor: dcodeDark50,//
    buttonColor: dcodeBlue50,
    scaffoldBackgroundColor: null,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      elevation: 0.0,
    ),
    canvasColor: Colors.white,
    cardColor: null,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: dcodeBlue50,
      cursorColor: dcodeBlue50,
      selectionHandleColor: dcodeBlue50,
    ),
    errorColor: dcodeErrorRed,
    buttonTheme: const ButtonThemeData(
      colorScheme: _dcodeLightColorScheme,
      textTheme: ButtonTextTheme.normal,
    ),
    primaryIconTheme: _customDcodeLightIconTheme(base.iconTheme),
    textTheme: _buildDcodeLightTextTheme(base.textTheme),
    primaryTextTheme: _buildDcodeLightTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildDcodeLightTextTheme(base.accentTextTheme),
    iconTheme: _customDcodeLightIconTheme(base.iconTheme),
  );
}

IconThemeData _customDcodeLightIconTheme(IconThemeData original) {
  return original.copyWith(color: dcodeDark200);
}

TextTheme _buildDcodeLightTextTheme(TextTheme base) {
  return base
      .copyWith(
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
        button: base.button.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
      )
      .apply(
        fontFamily: 'SourceSansPro',
      );
}

AppTheme githubLightTheme({@required String id}) {
  return AppTheme(
    id: id,
    description: "",
    data: buildDcodeLightTheme(),
  );
}
