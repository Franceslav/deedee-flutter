import 'package:geolocator/geolocator.dart';

import '../generated/TagService.pb.dart';
import '../generated/timestamp.pb.dart';

class ServiceRequest {
  final String requestId;
  final Tag tag;
  final double? price;
  final String description;
  final String customerName;
  final Position? customerAddress;
  final List<String>? customerContacts;
  final Timestamp dateOfRequest;
  final Timestamp? dateOfDeadline;
  final bool isDone;

  ServiceRequest({
    required this.requestId,
    required this.tag,
    this.price,
    required this.description,
    required this.customerName,
    this.customerAddress,
    this.customerContacts,
    required this.dateOfRequest,
    this.dateOfDeadline,
    required this.isDone
  });
}
