///
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Tag_TYPE extends $pb.ProtobufEnum {
  static const Tag_TYPE BUY = Tag_TYPE._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BUY');
  static const Tag_TYPE SELL = Tag_TYPE._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SELL');

  static const $core.List<Tag_TYPE> values = <Tag_TYPE> [
    BUY,
    SELL,
  ];

  static final $core.Map<$core.int, Tag_TYPE> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Tag_TYPE? valueOf($core.int value) => _byValue[value];

  const Tag_TYPE._($core.int v, $core.String n) : super(v, n);
}

