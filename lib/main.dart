import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testdev/UI/settings/settings_personal_information.dart';
import 'package:testdev/UI/settings/settings_player.dart';
import 'package:testdev/application/theme_Service.dart';
import 'package:testdev/root.dart';

import 'package:testdev/theme.dart';

import 'UI/onboarding/onboarding_start.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MaterialApp(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode:
              themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          routes: <String, WidgetBuilder>{
            "/root": (BuildContext context) => const RootWidget(),
            "/SettingPage": (BuildContext context) => const SettingPage(),
            "/SettingsPersonalInformation": (BuildContext context) =>
                const SettingsPersonalInformation(),
            "/OnboardingScreenStart": (BuildContext context) =>
                const Onboarding(),
          },
          home: const RootWidget());
    });
  }
}
