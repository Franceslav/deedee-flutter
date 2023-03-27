import 'package:flutter_map/plugin_api.dart';

class TagMarker {
  final String tagId;
  final String tagMessengerId;

  final Marker marker;

  TagMarker(
      {required this.tagId,
      required this.marker,
      required this.tagMessengerId});
}
