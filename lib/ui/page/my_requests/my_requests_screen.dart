import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:deedee/generated/request_service_service.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/repository/service_request_repository.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/global_widgets/dee_dee_menu_slider.dart';
import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/page/my_requests/bloc/my_request_bloc.dart';
import 'package:deedee/ui/page/my_requests/my_request_list.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MyRequestScreen extends StatefulWidget {
  const MyRequestScreen({super.key});

  @override
  State<MyRequestScreen> createState() => _MyRequestScreenState();
}

class _MyRequestScreenState extends State<MyRequestScreen> {
  final PanelController _controller = PanelController();
  final AnimatedButtonController _buttonController = AnimatedButtonController();
  List<ServiceRequest> _requests = [];
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    return BlocProvider<ServiceRequestBloc>(
      create: (context) =>
          ServiceRequestBloc(locator.get<ServiceRequestRepository>(), user),
      child: Scaffold(
        appBar: DeeDeeAppBar(
          title: AppLocalizations.of(context)!.myRequests,
          controller: _controller,
          child: const ProfilePhotoWithBadge(),
        ),
        body: Stack(
          children: [
            BlocConsumer<ServiceRequestBloc, MyRequestState>(
              listener: (context, state) {
                if (state is MyRequestLoadState) {
                  _requests = state.requests;
                }
                if (state is DeletedSuccessfulState) {
                  showSnackBar(
                    context,
                    AppLocalizations.of(context)!.tagRemovedMessage,
                  );
                }
                if (state is DeletedErrorState) {
                  _requests.insert(state.index, state.request);
                  showSnackBar(
                    context,
                    AppLocalizations.of(context)!.tagNotRemovedMessage,
                  );
                }
                if (state is ErrorState) {
                  showSnackBar(context, state.errorMessage);
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
                          MyRequestList(
                            requests: _requests,
                            isDone: false,
                            onDismissed: (request, userId, index) =>
                                deleteRequest(request, userId, index),
                          ),
                          MyRequestList(
                            requests: _requests,
                            isDone: true,
                            onDismissed: (tag, userId, index) =>
                                deleteRequest(tag, userId, index),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            DeeDeeMenuSlider(
              context,
              controller: _controller,
              user: user,
            ),
          ],
        ),
      ),
    );
  }

  void setPage(int indexPage) {
    _pageController.animateToPage(
      indexPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceIn,
    );
  }

  void deleteRequest(ServiceRequest request, String userId, int index) {
    setState(() {
      _requests.remove(request);
    });
    BlocProvider.of<ServiceRequestBloc>(context).add(MyRequestDeleteEvent(
      request: request,
      userId: userId,
      index: index,
    ));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
