import 'package:deedee/generated/deedee/api/model/service_request.pb.dart';
import 'package:deedee/ui/global_widgets/dee_dee_devider_widget.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'list_item.dart';

class ServiceRequestList extends StatefulWidget {
  final List<ServiceRequest_Status> statuses;
  final List<ServiceRequest> requests;
  final void Function(ServiceRequest request, String userId) onChanged;
  final void Function(ServiceRequest request, String userId, int index)
      onDismissed;
  final void Function(ServiceRequest request, String userId, int index)
      onAccept;

  const ServiceRequestList({
    super.key,
    required this.requests,
    required this.statuses,
    required this.onChanged,
    required this.onDismissed,
    required this.onAccept,
  });

  @override
  State<ServiceRequestList> createState() => _ServiceRequestListState();
}

class _ServiceRequestListState extends State<ServiceRequestList> {
  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    final requests = sortRequests();
    return requests.isEmpty
        ? Center(
            child: Text(
              AppLocalizations.of(context)!.notFound,
              style: Theme.of(context).textTheme.headline1,
            ),
          )
        : ListView.separated(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemBuilder: ((context, index) {
              final request = requests[index];
              return ServiceRequestListItem(
                request: request,
                onAccept: (_) {
                  widget.onAccept(request, user.userId, index);
                },
                onDismissed: (_) {
                  widget.onDismissed(request, user.userId, index);
                },
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
