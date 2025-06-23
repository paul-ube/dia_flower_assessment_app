import 'package:dia_flowers_assessment/app/app.bottomsheets.dart';
import 'package:dia_flowers_assessment/app/app.dialogs.dart';
import 'package:dia_flowers_assessment/app/app.locator.dart';
import 'package:dia_flowers_assessment/i18n/strings.g.dart';
import 'package:dia_flowers_assessment/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/app.router.dart';

/// Set up the stacked architecture
Future<void> _setupLocator() async {
  try {
    await ThemeManager.initialise();
    await setupLocator(stackedRouter: stackedRouter);
    setupDialogUi();
    setupBottomSheetUi();
  } catch (e) {
    // print('Error setting up locator: $e');
  }
}

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  await _setupLocator();

  runApp(TranslationProvider(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var lightTheme = getTheme(context, Brightness.light);
    var darkTheme = getTheme(context, Brightness.dark);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
      child: ThemeBuilder(
        lightTheme: lightTheme.copyWith(
          textTheme: GoogleFonts.rubikTextTheme(lightTheme.textTheme),
        ),
        darkTheme: darkTheme.copyWith(
          textTheme: GoogleFonts.rubikTextTheme(darkTheme.textTheme),
        ),
        builder: (context, lightTheme, darkTheme, themeMode) {
          return MaterialApp.router(
            title: 'Dia Flower Demo',
            debugShowCheckedModeBanner: false,
            themeMode: themeMode,
            theme: lightTheme,
            darkTheme: darkTheme,
            locale: TranslationProvider.of(context).flutterLocale,
            supportedLocales: [Locale('en'), Locale('ar')],
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            themeAnimationStyle:
                MediaQuery.of(context).disableAnimations
                    ? AnimationStyle.noAnimation
                    : null,
            routerDelegate: stackedRouter.delegate(),
            routeInformationParser: stackedRouter.defaultRouteParser(),
          );
        },
      ),
    );
  }
}
