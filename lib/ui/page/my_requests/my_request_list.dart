import 'package:auto_route/auto_route.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:deedee/constants.dart';
import 'package:deedee/generated/deedee/api/model/service_request.pb.dart';
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
  final List<ServiceRequest_Status> statuses;
  final List<ServiceRequest> requests;
  final void Function(ServiceRequest request, String userId) onChanged;
  final void Function(ServiceRequest request, String userId, int index)
      onDismissed;
  final void Function(ServiceRequest request, String userId, int index)
      onAccept;

  const MyRequestList({
    super.key,
    required this.requests,
    required this.statuses,
    required this.onChanged,
    required this.onDismissed,
    required this.onAccept,
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
                  extentRatio: 0.4,
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: ((context) {
                        widget.onAccept(request, user.userId, index);
                      }),
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(COLOR_PRIMARY),
                      icon: CommunityMaterialIcons.check,
                    ),
                    SlidableAction(
                      onPressed: ((context) {
                        widget.onDismissed(request, user.userId, index);
                      }),
                      backgroundColor: Colors.white,
                      foregroundColor: Theme.of(context).colorScheme.error,
                      icon: Icons.delete,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: DeeDeeRowInfoWidget(
                    icon: Image.asset('assets/images/bookmark_icon.png'),
                    mainText: Text(
                      request.createdBy,
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
    var requests = <ServiceRequest>[];
    for (var i = 0; i <= widget.statuses.length - 1; i++) {
      requests.addAll(widget.requests
          .where((request) => request.status == widget.statuses[i])
          .toList());
    }
    return requests;
  }
}
