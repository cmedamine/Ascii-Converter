import 'package:dcode/features/dcode/pages/about_page.dart';
import 'package:dcode/features/dcode/pages/rate_info_page.dart';
import 'package:dcode/features/dcode/widgets/rate_app_init_widget.dart';

import 'core/theme/app_theme.dart';
import 'features/dcode/bloc/dcode_bloc.dart';
import 'features/dcode/pages/text_hash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_provider/theme_provider.dart';

import 'features/dcode/pages/text_conversion_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      saveThemesOnChange: true,
      onInitCallback: (controller, previouslySavedThemeFuture) async {
        String savedTheme = await previouslySavedThemeFuture;
        if (savedTheme != null) {
          controller.setTheme(savedTheme);
        } else {
          Brightness platformBrightness =
              SchedulerBinding.instance.window.platformBrightness ??
                  Brightness.light;
          if (platformBrightness == Brightness.dark) {
            controller.setTheme('lark');
          } else {
            controller.setTheme('light');
          }
          controller.forgetSavedTheme();
        }
      },
      themes: <AppTheme>[
        githubLightTheme(id: 'light'),
        githubDarkTheme(id: 'dark')
      ],
      child: ThemeConsumer(
        child: Builder(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<DcodeBloc>(
                create: (context) => DcodeBloc(),
              ),
            ],
            child: RateAppInitWidget(
              builder: (rateMyApp) {
                return MaterialApp(
                  theme: ThemeProvider.themeOf(context).data,
                  title: 'ASCII Converter',
                  debugShowCheckedModeBanner: false,
                  home: TextConversionPage(
                    rateMyApp: rateMyApp,
                  ),
                  routes: {
                    TextConversionPage.textConvertionRoute: (context) =>
                        TextConversionPage(),
                    TextHashPage.textHashRoute: (context) => TextHashPage(),
                    AboutPage.route: (context) =>
                        AboutPage(rateMyApp: rateMyApp),
                    RateInfoPage.route: (context) => RateInfoPage(
                          rateMyApp: rateMyApp,
                        )
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
