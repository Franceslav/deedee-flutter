import 'package:deedee/ui/map_cubit/tag_marker/tag_marker.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MapPopup extends StatefulWidget {
  final TagMarker marker;

  const MapPopup(this.marker, {Key? key}) : super(key: key);

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
    return Card(
      child: InkWell(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: InkWell(
                child: Icon(_icons[_currentIcon]),
                onTap: () => setState(() {
                  _currentIcon = (_currentIcon + 1) % _icons.length;
                }),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              constraints: BoxConstraints(
                minWidth: 100,
                maxWidth: hidden ? 125 : 200,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: [
                      _MessengerLabelButton(
                          instagramUser: widget.marker.tagMessengerId),
                      const Spacer(),
                      IconButton(
                        onPressed: _toggleHideButton,
                        icon: Icon(
                          hidden ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                        ),
                      )
                    ],
                  ),
                  if (!hidden) ...[
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Position: ${widget.marker.marker.point.latitude}, ${widget.marker.marker.point.longitude}',
                        style: const TextStyle(fontSize: 12.0),
                      ),
                    ),
                    const Text(
                      '#маникюр #ногти',
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
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
      onTap: () => _launchInstagram(instagramUser),
    );
  }

  void _launchInstagram(String instagramUser) async {
    final path = "https://www.instagram.com/$instagramUser";
    final uri = Uri.parse(path);

    if (await canLaunchUrl(uri)) {
      await launchUrl(Uri.parse(path), mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch Instagram';
    }
  }
}
