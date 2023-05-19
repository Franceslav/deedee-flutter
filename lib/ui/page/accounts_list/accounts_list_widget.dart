import 'package:deedee/constants.dart';
import 'package:deedee/generated/deedee/api/model/account.pb.dart';
import 'package:deedee/ui/global_widgets/dee_dee_devider_widget.dart';
import 'package:deedee/ui/global_widgets/dee_dee_row_info_widget.dart';
import 'package:deedee/ui/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

enum AccountsType { active, block }

class AccountListWidget extends StatefulWidget {
  final AccountsType accountsType;
  final List<Account> accounts;
  final void Function(Account account, int index) onDismissed;

  const AccountListWidget({
    super.key,
    required this.accounts,
    required this.accountsType,
    required this.onDismissed,
  });

  @override
  State<AccountListWidget> createState() => _AccountListWidgetState();
}

class _AccountListWidgetState extends State<AccountListWidget> {
  @override
  Widget build(BuildContext context) {
    final accounts = widget.accounts;
    return accounts.isEmpty
        ? Center(
            child: Text(
              AppLocalizations.of(context)!.noUserAccounts,
              style: Theme.of(context).textTheme.headline1,
            ),
          )
        : ListView.separated(
            itemBuilder: ((context, index) {
              final account = accounts[index];
              return Slidable(
                endActionPane: ActionPane(
                  extentRatio: 0.5,
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: ((context) {}),
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(COLOR_PRIMARY),
                      icon: Icons.edit,
                    ),
                    SlidableAction(
                      onPressed: ((context) {}),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.red,
                      icon: Icons.delete,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: DeeDeeRowInfoWidget(
                    icon: Image.asset('assets/images/bookmark_icon.png'),
                    mainText: Text(
                      account.accountId.toString(),
                      style: AppTextTheme.bodyLarge,
                    ),
                    secondaryText: Text(
                      account.userId,
                      style: AppTextTheme.labelMedium,
                    ),
                    onTap: () {},
                  ),
                ),
              );
            }),
            itemCount: accounts.length,
            separatorBuilder: (context, index) {
              return const DeeDeeDeviderWidget();
            },
          );
  }
}
