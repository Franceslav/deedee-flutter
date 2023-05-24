import 'package:auto_route/auto_route.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:deedee/constants.dart';
import 'package:deedee/generated/deedee/api/model/service_request.pb.dart';
import 'package:deedee/ui/global_widgets/dee_dee_row_info_widget.dart';
import 'package:deedee/ui/page/my/my_requests/my_request_detail.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:deedee/ui/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ServiceRequestListItem extends StatelessWidget {
  final ServiceRequest request;
  final SlidableActionCallback onAccept;
  final SlidableActionCallback onDismissed;
  const ServiceRequestListItem(
      {Key? key,
      required this.request,
      required this.onAccept,
      required this.onDismissed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.4,
        motion: const ScrollMotion(),
        children: _buildActionsList(context),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: DeeDeeRowInfoWidget(
          icon: Image.asset('assets/images/bookmark_icon.png'),
          mainText: Text(
            request.status.name,
            style: AppTextTheme.bodyLarge,
          ),
          secondaryText: Text(
            request.description,
            style: AppTextTheme.labelMedium,
          ),
          onTap: () {
            switch (request.status) {
              case ServiceRequest_Status.DONE:
              case ServiceRequest_Status.DECLINED:
                {
                  showDialog(
                      context: context,
                      builder: (_) =>
                          Dialog(child: MyRequestDetail(request: request)));
                }
                break;
              case ServiceRequest_Status.PENDING:
                {
                  context.router.push(
                      RequestScreenRoute(
                          serviceRequestId: request.serviceRequestId,
                          readOnly: false
                      )
                  );
                }
                break;

              default:
                {
                  context.router.push(
                      RequestScreenRoute(
                          serviceRequestId: request.serviceRequestId,
                          readOnly: true
                      )
                  );
                }
                break;
            }
          },
        ),
      ),
    );
  }

  List<Widget> _buildActionsList(BuildContext context) {
    final Widget acceptAction = SlidableAction(
      onPressed: onAccept,
      backgroundColor: Colors.white,
      foregroundColor: const Color(COLOR_PRIMARY),
      icon: CommunityMaterialIcons.check,
    );

    final Widget deleteAction = SlidableAction(
      onPressed: onDismissed,
      backgroundColor: Colors.white,
      foregroundColor: Theme.of(context).colorScheme.error,
      icon: Icons.delete,
    );

    final Widget restoreAction = SlidableAction(
      onPressed: _onRestoreActionPressed,
      backgroundColor: Colors.white,
      foregroundColor: const Color(COLOR_PRIMARY),
      icon: CommunityMaterialIcons.restore,
    );

    switch (request.status) {
      case ServiceRequest_Status.PENDING:
        return [acceptAction, deleteAction];

      case ServiceRequest_Status.ACCEPTED:
        return [deleteAction];

      case ServiceRequest_Status.DECLINED:
        return [restoreAction];

      case ServiceRequest_Status.DELETED:
      case ServiceRequest_Status.DONE:
        return List.empty();

      default:
        return [acceptAction, deleteAction];
    }
  }

  void _onRestoreActionPressed(BuildContext context) {
    context.router.push(
        RequestScreenRoute(
          serviceRequestId: request.serviceRequestId,
          readOnly: false,
          openedFromRestoreAction: true
        )
    );
  }
}
