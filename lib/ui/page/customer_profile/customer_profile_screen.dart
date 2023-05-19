import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/page/account/account_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CustomerProfile extends StatefulWidget {
  final String id;
  const CustomerProfile({Key? key, required this.id}) : super(key: key);

  @override
  State<CustomerProfile> createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile> {
  final PanelController _controller = PanelController();

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: DeeDeeAppBar(
        title: locale.customerProfile,
        controller: _controller,
        child: const Icon(Icons.menu),
      ),
      body: const SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: AccountInfoWidget()),
    );
  }
}
