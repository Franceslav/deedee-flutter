import 'package:deedee/constants.dart';
import 'package:deedee/services/locator.dart';
import 'package:deedee/services/shared.dart';
import 'package:deedee/ui/account/account_cubit.dart';
import 'package:deedee/ui/auth/authentication_bloc.dart';
import 'package:deedee/ui/auth/launcherScreen/launcher_screen.dart';
import 'package:deedee/ui/filter/filter_bloc.dart';
import 'package:deedee/ui/filter/filter_box/filter_box_bloc.dart';
import 'package:deedee/ui/filter/predefined_filter/predefined_filter_bloc.dart';
import 'package:deedee/ui/home/filter_box/filter_box_bloc.dart';
import 'package:deedee/ui/home/home_bloc.dart';
import 'package:deedee/ui/loading_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  setUpServiceLocator();

  // serviceLocator.get<SharedUtils>().clearAll();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<LocaleCubit>(create: (_) => LocaleCubit()),
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => AuthenticationBloc()),
        RepositoryProvider(create: (_) => LoadingCubit()),
        // RepositoryProvider(create: (_) => PredefinedFilterBloc()),
        RepositoryProvider(create: (_) => FilterBoxHomeBloc()),
        // RepositoryProvider(create: (_) => FilterBloc()),
      ],
      child: const MyApp(),
    )
  ]));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with WidgetsBindingObserver {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if (_error) {
      return MaterialApp(
          locale: context.watch<LocaleCubit>().appLocal,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          home: Scaffold(
            body: Container(
              color: Colors.white,
              child: Center(
                  child: Column(
                children: const [
                  Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 25,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Failed to initialise firebase!',
                    style: TextStyle(color: Colors.red, fontSize: 25),
                  ),
                ],
              )),
            ),
          ));
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return Container(
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );
    }

    return MaterialApp(
        locale: context.watch<LocaleCubit>().appLocal,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        theme: ThemeData(
            snackBarTheme: const SnackBarThemeData(
                contentTextStyle: TextStyle(color: Colors.white)),
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: const Color(COLOR_PRIMARY))),
        debugShowCheckedModeBanner: false,
        color: const Color(COLOR_PRIMARY),
        home: const LauncherScreen());
  }

  @override
  void initState() {
    super.initState();
    initializeFlutterFire();
  }
}
