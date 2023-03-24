import 'package:community_material_icon/community_material_icon.dart';
import 'package:deedee/ui/place_order/place_order_simple_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../model/contact.dart';
import '../../model/user.dart';
import '../user_bloc/user_bloc.dart';

class PlaceOrderPopover extends StatelessWidget {
  const PlaceOrderPopover({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    final List<Widget> contactsTextField = [];
    if (user.contacts != null) {
      for (var i = 0; i < user.contacts!.length; i++) {
        contactsTextField.addIf(
          user.contacts![i].type == ContactType.email,
          ListTile(
            leading: const Icon(CommunityMaterialIcons.email),
            title: Text(
                '${AppLocalizations.of(context)!.email} (${user.contacts![i].value})'),
            trailing: const Icon(Icons.chevron_right),
          ),
        );
        contactsTextField.addIf(
          user.contacts![i].type == ContactType.phone,
          ListTile(
            leading: const Icon(CommunityMaterialIcons.phone),
            title: Text(
                '${AppLocalizations.of(context)!.phone} (${user.contacts![i].value})'),
            trailing: const Icon(Icons.chevron_right),
          ),
        );
        contactsTextField.addIf(
          user.contacts![i].type == ContactType.instagram,
          ListTile(
            leading: const Icon(CommunityMaterialIcons.instagram),
            title: Text(
                '${AppLocalizations.of(context)!.instagram} (${user.contacts![i].value})'),
            trailing: const Icon(Icons.chevron_right),
          ),
        );
        contactsTextField.addIf(
          user.contacts![i].type == ContactType.telegram,
          ListTile(
            leading: const Icon(CommunityMaterialIcons.telegram),
            title: Text(
                '${AppLocalizations.of(context)!.telegram} (${user.contacts![i].value})'),
            trailing: const Icon(Icons.chevron_right),
          ),
        );
      }
    }

    return Container(
      margin: const EdgeInsets.all(16.0),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FractionallySizedBox(
              widthFactor: 0.25,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 12.0,
                ),
                child: Container(
                  height: 5.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context).dividerColor,
                    borderRadius: const BorderRadius.all(Radius.circular(2.5)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height:
                  user.contacts == null ? 70 : user.contacts!.length * 70 + 70,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...List.generate(contactsTextField.length, (index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop(index);
                          },
                          child: contactsTextField[index]);
                    }),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const PlaceOrderSimpleDialog();
                          },
                        );
                      },
                      child: const ListTile(
                        leading: Icon(Icons.add_circle),
                        title: Text('Add account'),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
