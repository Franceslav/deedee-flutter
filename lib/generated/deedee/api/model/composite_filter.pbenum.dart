///
//  Generated code. Do not modify.
//  source: deedee/api/model/composite_filter.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class CompositeFilter_Status extends $pb.ProtobufEnum {
  static const CompositeFilter_Status FAVORITE = CompositeFilter_Status._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FAVORITE');
  static const CompositeFilter_Status CHANGED = CompositeFilter_Status._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CHANGED');
  static const CompositeFilter_Status DELETED = CompositeFilter_Status._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DELETED');

  static const $core.List<CompositeFilter_Status> values = <CompositeFilter_Status> [
    FAVORITE,
    CHANGED,
    DELETED,
  ];

  static final $core.Map<$core.int, CompositeFilter_Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CompositeFilter_Status? valueOf($core.int value) => _byValue[value];

  const CompositeFilter_Status._($core.int v, $core.String n) : super(v, n);
}

