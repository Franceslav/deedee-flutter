import 'package:deedee/generated/request_service_service.pb.dart';
import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

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
  final PanelController _controller = PanelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeeDeeAppBar(
        title: 'Request',
        controller: _controller,
        child: const ProfilePhotoWithBadge(),
      ),
      body: ListView(
        children: [
          Text(widget.request.clientId),
          Text(widget.request.description),
          Text(widget.request.requestId),
          if (widget.request.description != null)
          //   Text(widget.request.customerAddress.toString()),
          // if (widget.request.customerContacts != null)
          //   Text(widget.request.customerContacts.toString()),
          // if (widget.request.dateOfDeadline != null)
          //   Text(widget.request.dateOfDeadline.toString()),
          // Text(widget.request.dateOfRequest.toString()),
          widget.request.status == ServiceRequest_Status.DONE
              ? const Text('Already done')
              : const Text('In Process'),
          // Text(widget.request.tag.messengerId),
          // Text(widget.request.tag.tagId),
          // Text(widget.request.tag.topicId),
          // Text(widget.request.tag.geoLocation.toString()),
        ],
      ),
    );
  }
}