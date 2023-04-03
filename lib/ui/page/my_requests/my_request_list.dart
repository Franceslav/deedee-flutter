import 'package:auto_route/auto_route.dart';
import 'package:deedee/generated/request_service_service.pb.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              return Dismissible(
                key: ValueKey(request.requestId),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Theme.of(context).errorColor,
                  alignment: Alignment.centerRight,
                  child: const Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                onDismissed: (direction) {
                  widget.onDismissed(request, user.userId, index);
                },
                child: ListTile(
                  leading: const Icon(
                    Icons.work,
                    size: 64,
                  ),
                  title: Text(
                    request.clientId,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text(request.description),
                  trailing: const SizedBox(
                    height: double.infinity,
                    child: Icon(
                      Icons.chevron_right,
                      size: 40,
                    ),
                  ),
                  onTap: () {
                    // context.router.push(MyRequestDetailRoute(request: request));
                  },
                ),
              );
            }),
            itemCount: requests.length,
            separatorBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey,
              );
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
