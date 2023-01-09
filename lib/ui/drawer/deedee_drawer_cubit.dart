import 'package:bloc/bloc.dart';
import 'package:deedee/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';
part 'deedee_drawer_state.dart';

class DeedeeDrawerCubit extends Cubit<DeedeeDrawerState> {
  DeedeeDrawerCubit() : super(DeedeeDrawerInitial());
  final uuid = Uuid();

  void showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Link copied'),
      ),
    );
  }
   String uudiURL(String email) {
    var uuidValue = uuid.v5(
        Uuid.NAMESPACE_URL,
        "${HTTPS_REF_DOMAIN}${email}");
    var ValueURL = "${HTTPS_REF_DOMAIN}${uuidValue}";
    Clipboard.setData(ClipboardData(text: "$ValueURL"));
    return  ValueURL;
  }
}
