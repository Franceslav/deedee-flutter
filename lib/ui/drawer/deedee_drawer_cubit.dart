import 'package:bloc/bloc.dart';
import 'package:deedee/constants.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/services/grpc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

part 'deedee_drawer_state.dart';

class DeedeeDrawerCubit extends Cubit<DeedeeDrawerState> {
  DeedeeDrawerCubit() : super(DeedeeDrawerInitial());
  final uuid = const Uuid();

  void showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      const SnackBar(
        content: Text('Link copied'),
      ),
    );
  }

  String uudiURL(String email) {
    var uuidValue = uuid.v5(
      Uuid.NAMESPACE_URL,
      '$HTTPS_REF_DOMAIN$email',
    );
    var valueURL = '$HTTPS_REF_DOMAIN$uuidValue';
    Clipboard.setData(
      ClipboardData(text: valueURL),
    );
    return valueURL;
  }

  Future<double> getBalance(String userId) async {
    return locator.get<GRCPRepository>().getUserBalance(userId);
  }
}
