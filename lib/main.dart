import 'package:deedee/constants.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/repository/topic_repository.dart';
import 'package:deedee/ui/auth/authentication_bloc.dart';
import 'package:deedee/ui/filter_dto_bloc/filter_dto_bloc.dart';
import 'package:deedee/ui/loading_cubit.dart';
import 'package:deedee/ui/main_topic/bloc/main_topics_bloc.dart';
import 'package:deedee/ui/page/bookmarks/bloc/bookmarks_bloc.dart';
import 'package:deedee/ui/place_tag/bloc/set_location_bloc.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:deedee/ui/theme/deedee_theme.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:deedee/ui/user_tag_details/bloc/user_tag_details_bloc.dart';
import 'package:deedee/ui/user_tags/bloc/user_tags_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:search_address_repository/search_address_repository.dart';

import 'ui/page/account/account_bloc.dart';

void main() {
  configureDependencies('dev');
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // locator.get<SharedUtils>().clearAll();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AccountBloc>(create: (_) => AccountBloc()),
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => AuthenticationBloc()),
        RepositoryProvider(create: (_) => LoadingCubit()),
        RepositoryProvider(create: (_) => SearchAddressRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SetLocationBloc(
              searchAddressRepository:
                  RepositoryProvider.of<SearchAddressRepository>(context),
            ),
          ),
          BlocProvider(
            create: (_) => UserBloc(),
          ),
          BlocProvider(
            create: (_) => FilterDTOBloc(),
          ),
          BlocProvider(
            create: (_) => BookmarksBloc(),
          ),
          BlocProvider(
            create: (_) => MainTopicsBloc(locator.get<TopicRepository>()),
          ),
          BlocProvider(
            create: (_) => UserTagsBloc(),
          ),
          BlocProvider(
            create: (_) => UserTagDetailsBloc(),
          ),
          BlocProvider(
            create: (_) => BookmarksBloc(),
          ),
        ],
        child: const MyApp(),
      ),
    ),
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
  final _appRouter = AppRouter();

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
        locale: context.watch<AccountBloc>().appLocal,
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
        ),
      );
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

    return OverlaySupport.global(
      child: MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        locale: context.watch<AccountBloc>().appLocal,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        theme: deeDeeTheme,
        debugShowCheckedModeBanner: false,
        color: const Color(COLOR_PRIMARY),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initializeFlutterFire();
  }
}
