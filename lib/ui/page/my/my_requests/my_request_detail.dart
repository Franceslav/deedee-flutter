import 'package:auto_route/auto_route.dart';
import 'package:deedee/generated/deedee/api/model/service_request.pb.dart';
import 'package:deedee/ui/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyRequestDetail extends StatefulWidget {
  final ServiceRequest request;

  const MyRequestDetail({
    super.key,
    required this.request,
  });

  @override
  State<MyRequestDetail> createState() => _MyRequestDetailState();
}

class _MyRequestDetailState extends State<MyRequestDetail> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRequestInfo("Price: ${widget.request.price}"),
          _buildRequestInfo("Status: ${widget.request.status}"),
          _buildRequestInfo("Created for: ${widget.request.createdFor}"),
          _buildRequestInfo("Description: ${widget.request.description}"),
          _buildRequestInfo("Service request ID: ${widget.request.serviceRequestId}"),
          //   Text(widget.request.customerAddress.toString()),
          // if (widget.request.customerContacts != null)
          //   Text(widget.request.customerContacts.toString()),
          // if (widget.request.dateOfDeadline != null)
          //   Text(widget.request.dateOfDeadline.toString()),
          // Text(widget.request.dateOfRequest.toString()),
          if(widget.request.status == ServiceRequest_Status.PENDING)
            const Text('not accepted'),
          if(widget.request.status == ServiceRequest_Status.ACCEPTED)
            Text(AppLocalizations.of(context)!.inProcess),
          if(widget.request.status == ServiceRequest_Status.DONE)
            Text(AppLocalizations.of(context)!.alreadyDone),
          if(widget.request.status == ServiceRequest_Status.DELETED)
            const Text('Deleted'),
          // Text(widget.request.tag.messengerId),
          // Text(widget.request.tag.tagId),
          // Text(widget.request.tag.topicId),
          // Text(widget.request.tag.geoLocation.toString()),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                  onPressed: () {
                    context.router.pop();
                  },
                  child: const Text("Ok")
              )
            ]
          )
        ],
      ),
    );
  }

  Widget _buildRequestInfo(String info) =>
      Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(info, style: AppTextTheme.bodyLarge,)
      );
}
