import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:deedee/generated/deedee/api/model/account.pb.dart';
import 'package:deedee/generated/deedee/api/model/location.pb.dart';
import 'package:deedee/generated/deedee/api/model/verification.pb.dart';
import 'package:deedee/generated/deedee/api/service/account_service.pbgrpc.dart';
import 'package:deedee/generated/deedee/api/service/verification_service.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/repository/account_repository.dart';
import 'package:deedee/repository/location_repository.dart';
import 'package:deedee/services/http_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import '../../model/contact.dart';
import '../../repository/gps_repository.dart';
part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState(User.empty)) {
    on<UserAuthenticated>(_onUserAuthenticated);
    on<UserGetBalance>(_onUserGetBalance);
    on<UserSwitchAccountType>(_onUserSwitchAccountType);
    on<UserTogglePremium>(_onUserTogglePremium);
    on<UserCreateVerification>(_onUserCreateVerification);
    on<UserDocVerification>(_onUserDocVerification);
    on<UserSetLastGeolocation>(_onUserSetLastGeolocation);
    on<UserImagePicker>(_onUserImagePicker);
    on<UserAvailablePlaces>(_onUserAvailablePlaces);
    on<AddUserContact>(_onAddUserContact);
    on<UserGetGPSPosition>(_onGetUserGPSPosition);
  }

  _onUserAuthenticated(UserAuthenticated event, Emitter<UserState> emit) {
    emit(UserState(event.user));
  }

  _onUserGetBalance(UserGetBalance event, Emitter<UserState> emit) async {
    try {
      final balance = await locator.get<AccountServiceClient>().getAccounts(
            AccountRequest(
              account: Account(userId: state.user.userId),
            )..account.balance.first,
          );
      emit(
        UserState(
          state.user.copyWith(
              balance: double.parse(
            balance.toString(),
          )),
        ),
      );
    } catch (error) {
      print(error.toString());
    }
  }

  _onUserSwitchAccountType(
      UserSwitchAccountType event, Emitter<UserState> emit) {
    emit(UserState(state.user.copyWith(accountType: event.accountType)));
  }

  _onUserTogglePremium(UserTogglePremium event, Emitter<UserState> emit) async {
    emit(
        UserState(state.user.copyWith(premiumStatus: PremiumStatus.isPremium)));

    try {
      final response =
          await locator.get<AccountRepository>().getAll(state.user.userId);

      // if (response) {}
    } catch (error) {
      print(error.toString());
    }
  }

  _onUserCreateVerification(
      UserCreateVerification event, Emitter<UserState> emit) async {
    emit(UserState(state.user
        .copyWith(emailVerification: EmailVerificationStatus.verified)));
    try {
      final response = await locator
          .get<VerificationServiceClient>()
          .createVerification(VerificationRequest(
            verification: Verification(status: Verification_Status.SENT),
          ));
    } catch (error) {
      print(error.toString());
    }
  }

  _onUserImagePicker(UserImagePicker event, Emitter<UserState> emit) async {
    final type = event.type;
    final session = locator.get<HttpService>();
    final image = await ImagePicker().pickImage(source: type);
    if (image == null) return;
    final imageTemp = File(image.path);
    await session.onUploadImage(imageTemp);
  }

  _onUserDocVerification(
      UserDocVerification event, Emitter<UserState> emit) async {
    try {
      emit(UserState(state.user
          .copyWith(docVerification: DocVerificationStatus.verified)));
      /* final response =
            await locator.get<GRCPRepository>().verifyUserIdentity(event.files);*/
    } catch (error) {
      print(error.toString());
    }
  }

  _onUserSetLastGeolocation(
      UserSetLastGeolocation event, Emitter<UserState> emit) {
    emit(UserState(state.user.copyWith(lastGeoLocation: event.location)));
  }

  _onUserAvailablePlaces(
    UserAvailablePlaces event,
    Emitter<UserState> emit,
  ) async {
    List<Location> places =
        await locator.get<LocationRepository>().getAllLocations();
    emit(
      UserState(
        state.user.copyWith(availablePlaces: places),
      ),
    );
  }

  _onAddUserContact(AddUserContact event, Emitter<UserState> emit) async {
    final contacts = state.user.contacts ?? [];
    emit(
      UserState(
        state.user.copyWith(
          contacts: contacts..add(event.contact),
        ),
      ),
    );
  }

  _onGetUserGPSPosition(
      UserGetGPSPosition event, Emitter<UserState> emit) async {
    try {
      var fp = await GPSRepository().getGPSPosition();
      emit(
        UserState(
          state.user.copyWith(
            lastGeoLocation: LatLng(fp?.latitude ?? 0, fp?.longitude ?? 0),
          ),
        ),
      );
    } catch (error) {}
  }
}