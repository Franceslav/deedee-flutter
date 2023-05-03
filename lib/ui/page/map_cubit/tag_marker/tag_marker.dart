import 'package:fixnum/fixnum.dart';
import 'package:flutter_map/plugin_api.dart';

class TagMarker {
  final Int64 tagId;
  final String tagMessengerId;
  final Int64 creatorId;
  final Marker marker;

  TagMarker(
      {required this.tagId,
      required this.marker,
      required this.creatorId,
      required this.tagMessengerId});
}
