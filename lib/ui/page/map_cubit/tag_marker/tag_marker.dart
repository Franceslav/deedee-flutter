import 'package:fixnum/fixnum.dart';
import 'package:flutter_map/plugin_api.dart';

class TagMarker {
  final Int64 tagId;
  final String tagMessengerId;

  final Marker marker;

  TagMarker(
      {required this.tagId,
      required this.marker,
      required this.tagMessengerId});
}
