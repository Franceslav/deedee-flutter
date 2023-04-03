import 'package:auto_route/auto_route.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:deedee/constants.dart';
import 'package:deedee/generated/request_service_service.pb.dart';
import 'package:deedee/ui/global_widgets/dee_dee_devider_widget.dart';
import 'package:deedee/ui/global_widgets/dee_dee_row_info_widget.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:deedee/ui/theme/app_text_theme.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyRequestList extends StatefulWidget {
  final bool isDone;
  final List<ServiceRequest> requests;
  final void Function(ServiceRequest request, String userId, int index)
      onDismissed;

  const MyRequestList({
    super.key,
    required this.requests,
    required this.isDone,
    required this.onDismissed,
  });

  @override
  State<MyRequestList> createState() => _MyRequestListState();
}

class _MyRequestListState extends State<MyRequestList> {
  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);

    final requests = sortRequests();
    return requests.isEmpty
        ? Center(
            child: Text(
              AppLocalizations.of(context)!.noUserTags,
              style: Theme.of(context).textTheme.headline1,
            ),
          )
        : ListView.separated(
            itemBuilder: ((context, index) {
              final request = requests[index];
              return Slidable(
                endActionPane: ActionPane(
                  extentRatio: 0.5,
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: ((context) {}),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.orange,
                      icon: CommunityMaterialIcons.star,
                    ),
                    SlidableAction(
                      onPressed: ((context) {}),
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(COLOR_PRIMARY),
                      icon: Icons.edit,
                    ),
                    SlidableAction(
                      onPressed: ((context) {
                        widget.onDismissed(request, user.userId, index);
                      }),
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
                      request.clientId,
                      style: AppTextTheme.bodyLarge,
                    ),
                    secondaryText: Text(
                      request.description,
                      style: AppTextTheme.labelMedium,
                    ),
                    onTap: () {
                      context.router
                          .push(MyRequestDetailRoute(request: request));
                    },
                  ),
                ),
              );
            }),
            itemCount: requests.length,
            separatorBuilder: (context, index) {
              return const DeeDeeDeviderWidget();
            },
          );
  }

  List<ServiceRequest> sortRequests() {
    if (widget.isDone) {
      return widget.requests
          .where((request) =>
              request.status == ServiceRequest_Status.DONE ||
              request.status == ServiceRequest_Status.DELETED)
          .toList();
    } else {
      return widget.requests
          .where((request) =>
              request.status != ServiceRequest_Status.DONE &&
              request.status != ServiceRequest_Status.DELETED)
          .toList();
    }
  }
}
