///
//  Generated code. Do not modify.
//  source: request_service_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ServiceRequest_Status extends $pb.ProtobufEnum {
  static const ServiceRequest_Status PENDING = ServiceRequest_Status._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PENDING');
  static const ServiceRequest_Status ACCEPTED = ServiceRequest_Status._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ACCEPTED');
  static const ServiceRequest_Status CHANGED = ServiceRequest_Status._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CHANGED');
  static const ServiceRequest_Status DELETED = ServiceRequest_Status._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DELETED');
  static const ServiceRequest_Status IN_PROGRESS = ServiceRequest_Status._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IN_PROGRESS');
  static const ServiceRequest_Status DONE = ServiceRequest_Status._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DONE');

  static const $core.List<ServiceRequest_Status> values = <ServiceRequest_Status> [
    PENDING,
    ACCEPTED,
    CHANGED,
    DELETED,
    IN_PROGRESS,
    DONE,
  ];

  static final $core.Map<$core.int, ServiceRequest_Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ServiceRequest_Status? valueOf($core.int value) => _byValue[value];

  const ServiceRequest_Status._($core.int v, $core.String n) : super(v, n);
}

