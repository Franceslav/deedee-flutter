import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:deedee/generated/deedee/api/model/account.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/repository/account_repository.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/global_widgets/profile_menu_slider.dart';
import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/page/accounts_list/accounts_list_widget.dart';
import 'package:deedee/ui/page/accounts_list/bloc/accounts_list_bloc.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AccountsListScreen extends StatefulWidget {
  const AccountsListScreen({super.key});

  @override
  State<AccountsListScreen> createState() => _AccountsListScreenState();
}

class _AccountsListScreenState extends State<AccountsListScreen> {
  late List<Account> _accounts;
  final PanelController _controller = PanelController();
  final AnimatedButtonController _buttonController = AnimatedButtonController();
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void setPage(int indexPage) {
    _pageController.animateToPage(
      indexPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final user = context.select((UserBloc bloc) => bloc.state.user);
    var bloc = AccountsListBloc(locator.get<AccountRepository>(), user);

    return BlocProvider<AccountsListBloc>(
      create: (context) => bloc,
      child: Scaffold(
        appBar: DeeDeeAppBar(
            title: locale.accountTitle,
            controller: _controller,
            child: ProfilePhotoWithBadge(canChangePhoto: false, radius: 20, fontSize: 20,),),
        body: BlocConsumer<AccountsListBloc, AccountsListState>(
          bloc: bloc,
          listener: (context, state) {
            if (state is AccountsLoadState) {
              _accounts = state.accounts;
            }
            if (state is ErrorState) {
              showSnackBar(context, state.errorMessage);
            }
          },
          builder: (context, state) {
            return state is AccountsListInitial
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Stack(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: AnimatedButtonBar(
                              invertedSelection: true,
                              radius: 25,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              controller: _buttonController,
                              children: [
                                ButtonBarEntry(
                                  child: Text(
                                      AppLocalizations.of(context)!.actualTags),
                                  onTap: () {
                                    bloc.add(AccountsActiveEvent(
                                        activeAccounts: _accounts));
                                    setPage(0);
                                  },
                                ),
                                ButtonBarEntry(
                                  child: Text(AppLocalizations.of(context)!
                                      .archiveTags),
                                  onTap: () {
                                    bloc.add(AccountBlockedEvent(
                                        blockedAccounts: _accounts));
                                    setPage(1);
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: AppLocalizations.of(context)!.search,
                                border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 16,
                                ),
                              ),
                              onChanged: (value) {},
                            ),
                          ),
                          const Divider(
                            thickness: 0.5,
                            color: Colors.black,
                            height: 0,
                          ),
                          Expanded(
                            child: PageView(
                              controller: _pageController,
                              onPageChanged: (value) =>
                                  _buttonController.setIndex(value),
                              children: [
                                AccountListWidget(
                                    accounts: _accounts,
                                    accountsType: AccountsType.active,
                                    onDismissed: (account, index) {}),
                                AccountListWidget(
                                    accounts: _accounts,
                                    accountsType: AccountsType.block,
                                    onDismissed: (account, index) {}),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ProfileMenuSlider(
                        context,
                        controller: _controller,
                        user: user,
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
