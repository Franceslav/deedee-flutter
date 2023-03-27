import 'package:deedee/ui/page/map_cubit/map_screen.dart';
import 'package:deedee/ui/page/map_cubit/tag_marker/tag_marker.dart';
import 'package:flutter/material.dart';

class MapPopup extends StatefulWidget {
  final TagMarker marker;
  final DeeDeeSliderController _pc;

  const MapPopup(this.marker, this._pc, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MapPopupState();
}

class _MapPopupState extends State<MapPopup> {
  final List<IconData> _icons = [
    Icons.star_border,
    Icons.star_half,
    Icons.star
  ];
  int _currentIcon = 0;

  bool hidden = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget._pc.open();
      },
      child: Icon(
        Icons.location_on,
        size: 50.0,
      ),
    );
  }

  void _toggleHideButton() {
    setState(() {
      hidden = !hidden;
    });
  }
}

class _MessengerLabelButton extends StatelessWidget {
  const _MessengerLabelButton({
    Key? key,
    required this.instagramUser,
  }) : super(key: key);

  final String instagramUser;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        instagramUser,
        overflow: TextOverflow.fade,
        softWrap: false,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14.0,
        ),
      ),
      onTap: () {},
    );
  }
}
