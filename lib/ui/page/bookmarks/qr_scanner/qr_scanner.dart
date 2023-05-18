import 'dart:developer';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:deedee/ui/page/bookmarks/bloc/bookmarks_bloc.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class BookmarkQRScanner extends StatefulWidget {
  const BookmarkQRScanner({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BookmarkQRScannerState();
}

class _BookmarkQRScannerState extends State<BookmarkQRScanner> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildQrView(context),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
      this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
        result = scanData;
        // BlocProvider.of<BookmarksBloc>(context)
        //     .add(AddBookmarkEvent(userId: describeEnum(result!.format), tagId: ''));
        context.router.replace(const BookmarksScreenRoute());
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      context.router.pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
