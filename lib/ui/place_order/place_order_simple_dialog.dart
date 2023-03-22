import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../model/contact.dart';
import '../user_bloc/user_bloc.dart';

class PlaceOrderSimpleDialog extends StatelessWidget {
  const PlaceOrderSimpleDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        GestureDetector(
          onTap: () {
            context.read<UserBloc>().add(
                  AddUserContact(
                    Contact(ContactType.email, ' ', ''),
                  ),
                );
            Navigator.of(context).pop();
          },
          child: ListTile(
            leading: const Icon(CommunityMaterialIcons.email),
            title: Text(
              AppLocalizations.of(context)!.email,
            ),
            trailing: const Icon(Icons.add_circle),
          ),
        ),
        GestureDetector(
          onTap: () {
            context.read<UserBloc>().add(
                  AddUserContact(
                    Contact(ContactType.phone, ' ', ''),
                  ),
                );
            Navigator.of(context).pop();
          },
          child: ListTile(
            leading: const Icon(CommunityMaterialIcons.phone),
            title: Text(
              AppLocalizations.of(context)!.phone,
            ),
            trailing: const Icon(Icons.add_circle),
          ),
        ),
        GestureDetector(
          onTap: () {
            context.read<UserBloc>().add(
                  AddUserContact(
                    Contact(ContactType.instagram, ' ', ''),
                  ),
                );
            Navigator.of(context).pop();
          },
          child: ListTile(
            leading: const Icon(CommunityMaterialIcons.instagram),
            title: Text(
              AppLocalizations.of(context)!.instagram,
            ),
            trailing: const Icon(Icons.add_circle),
          ),
        ),
        GestureDetector(
          onTap: () {
            context.read<UserBloc>().add(
                  AddUserContact(
                    Contact(ContactType.telegram, ' ', ''),
                  ),
                );
            Navigator.of(context).pop();
          },
          child: ListTile(
            leading: const Icon(CommunityMaterialIcons.telegram),
            title: Text(
              AppLocalizations.of(context)!.telegram,
            ),
            trailing: const Icon(Icons.add_circle),
          ),
        ),
      ],
    );
  }
}
