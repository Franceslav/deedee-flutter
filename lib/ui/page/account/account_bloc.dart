import 'package:bloc/bloc.dart';
import 'package:deedee/constants.dart';
import 'package:deedee/generated/deedee/api/model/location.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/repository/location_repository.dart';
import 'package:deedee/ui/page/account/account_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> with ChangeNotifier {
  AccountBloc._sharedInstance() : super(AccountInitial()) {
    on<LoadPlacesEvent>((event, emit) async {
      List<Location> places =
          await locator.get<LocationRepository>().getAllLocations();
      emit(AccountPlacesLoadState(places));
    });
  }

  static final AccountBloc _shared = AccountBloc._sharedInstance();

  factory AccountBloc() => _shared;

  final uuid = const Uuid();

  Locale? _appLocale;

  Locale? get appLocal => _appLocale;

  void changeLocal(String s) {
    _appLocale = Locale(s);
    notifyListeners();
  }

  void showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Link copied'),
      ),
    );
  }

  String uudiURL(String email) {
    var uuidValue = uuid.v5(Uuid.NAMESPACE_URL, "${HTTPS_REF_DOMAIN}${email}");
    var ValueURL = "${HTTPS_REF_DOMAIN}${uuidValue}";
    Clipboard.setData(ClipboardData(text: "$ValueURL"));
    return ValueURL;
  }

  int index = 1;
}
