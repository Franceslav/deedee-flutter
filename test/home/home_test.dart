import 'package:deedee/injection.dart';
import 'package:deedee/services/gps_service.dart';
import 'package:deedee/ui/deedee_button/deedee_button.dart';
import 'package:deedee/ui/home/home_screen.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockGPSService extends Mock implements GPSRepository {}
//golden toolkit
void main() {
  GPSRepository gpsService;
  // WidgetsFlutterBinding.ensureInitialized();

/*  setUpAll(() {
    gpsService = MockGPSService();
    locator.registerFactory<GPSService>(() => gpsService);
  });*/
/*

  group('Bloc Success Scenarios: ', () {

    blocTest<UserBloc, UserState>('When data is empty',
        setUp: (() {}),
        build: () => UserBloc(),
        wait: const Duration(milliseconds: 500),
        expect: () => []);
  });

*/
  testWidgets('Button is present and triggers navigation after tapped',
      (WidgetTester tester) async {
    final mockObserver = MockNavigatorObserver();
    gpsService = MockGPSService();
    locator.registerFactory<GPSRepository>(() => gpsService);
    // when(locator.get<GPSService>())
    //     .thenAnswer((_) => gpsService);

    when(gpsService.getGPSPosition()).thenAnswer((_) => Future(() => {}));

    await tester.pumpWidget(Localizations(
      delegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      locale: const Locale('en'),
      child: BlocProvider<UserBloc>(
        create: (_) => UserBloc(),
        child: MaterialApp(
          home: const HomeScreen(),
          navigatorObservers: [mockObserver],
        ),
      ),
    ));

    expect(find.byType(DeeDeeButton), findsOneWidget);
    await tester.tap(find.byType(DeeDeeButton));
    await tester.pumpAndSettle();

    /// Verify that a push event happened
    verify(mockObserver.didPush(any!, any));

    /// You'd also want to be sure that your page is now
    /// present in the screen.
    // expect(find.byType(DetailsPage), findsOneWidget);
  });
}
