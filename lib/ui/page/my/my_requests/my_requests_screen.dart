import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:deedee/generated/deedee/api/model/service_request.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/repository/service_request_repository.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/global_widgets/dee_dee_menu_slider.dart';
import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/page/my/my_requests/bloc/my_request_bloc.dart';
import 'package:deedee/ui/page/my/my_requests/my_request_list.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../global_widgets/profile_menu_slider.dart';

class MyRequestScreen extends StatefulWidget {
  const MyRequestScreen({super.key});

  @override
  State<MyRequestScreen> createState() => _MyRequestScreenState();
}

class _MyRequestScreenState extends State<MyRequestScreen> {
  late final PanelController _controller;
  late final AnimatedButtonController _buttonController;
  late final PageController _pageController;

  late final User _user;
  late final ServiceRequestBloc _bloc;

  void setPage(int indexPage) {
    _pageController.animateToPage(
      indexPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceIn,
    );
  }

  @override
  void initState() {
    _controller = PanelController();
    _buttonController = AnimatedButtonController();
    _pageController = PageController();
    _user = BlocProvider.of<UserBloc>(context).state.user;
    _bloc = ServiceRequestBloc(locator.get<ServiceRequestRepository>(), _user);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool _listenCondition(MyRequestState previous, MyRequestState current) =>
      (previous.errorMessage != current.errorMessage &&
          current.errorMessage.isNotEmpty) ||
      (previous.snackBarMessage != current.snackBarMessage &&
          current.snackBarMessage.isNotEmpty);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ServiceRequestBloc>(
      create: (context) => _bloc,
      child: Scaffold(
        appBar: DeeDeeAppBar(
          title: AppLocalizations.of(context)!.myRequests,
          controller: _controller,
          child: ProfilePhotoWithBadge(canChangePhoto: false, radius: 20, fontSize: 20,),
        ),
        floatingActionButton: IconButton(
          onPressed: () {
            _bloc.add(MyRequestCreateEvent());
          },
          icon: const Icon(Icons.add),
        ),
        body: Stack(
          children: [
            BlocConsumer<ServiceRequestBloc, MyRequestState>(
              listenWhen: _listenCondition,
              listener: (context, state) {
                if (state.errorMessage.isNotEmpty) {
                  showSnackBar(context, state.errorMessage);
                }
                if (state.snackBarMessage.isNotEmpty) {
                  showSnackBar(context, state.snackBarMessage);
                }
              },
              builder: (context, state) {
                return Column(
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
                            child:
                                Text(AppLocalizations.of(context)!.actualTags),
                            onTap: () => setPage(0),
                          ),
                          ButtonBarEntry(
                            child:
                                Text(AppLocalizations.of(context)!.archiveTags),
                            onTap: () => setPage(1),
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
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                        ),
                        onChanged: (value) {
                          _bloc.add(SearchRequestEvent(value));
                        },
                      ),
                    ),
                    Expanded(
                      child: state.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : PageView(
                              controller: _pageController,
                              onPageChanged: (value) =>
                                  _buttonController.setIndex(value),
                              children: [
                                MyRequestList(
                                    requests: state.searchText.trim().isEmpty
                                        ? state.requests
                                        : state.requestsSearch,
                                    statuses: const [
                                      ServiceRequest_Status.PENDING,
                                      ServiceRequest_Status.ACCEPTED,
                                    ],
                                    onDismissed: (request, userId, index) =>
                                        _bloc.add(MyRequestDeleteEvent(
                                          request: request,
                                          index: index,
                                        )),
                                    onAccept: (request, userId, index) {
                                      _bloc.add(MyRequestAcceptEvent(
                                        userId: userId,
                                        request: request,
                                        index: index,
                                      ));
                                    },
                                    onChanged: (request, userId) =>
                                        _bloc.add(UpdateRequestEvent(
                                          request: request,
                                          userId: userId,
                                        ))),
                                MyRequestList(
                                  requests: state.searchText.trim().isEmpty
                                      ? state.requests
                                      : state.requestsSearch,
                                  statuses: const [
                                    ServiceRequest_Status.DECLINED,
                                    ServiceRequest_Status.DELETED,
                                    ServiceRequest_Status.DONE,
                                  ],
                                  onDismissed: (request, userId, index) =>
                                      _bloc.add(MyRequestDeleteEvent(
                                    request: request,
                                    index: index,
                                  )),
                                  onAccept: (request, userId, index) {
                                    _bloc.add(MyRequestAcceptEvent(
                                      userId: userId,
                                      request: request,
                                      index: index,
                                    ));
                                  },
                                  onChanged: (request, userId) => _bloc.add(
                                    UpdateRequestEvent(
                                      request: request,
                                      userId: userId,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ],
                );
              },
            ),
            ProfileMenuSlider(
              context,
              controller: _controller,
              user: _user,
            ),
          ],
        ),
      ),
    );
  }
}
