import 'package:deedee/ui/map_cubit/tag_marker/tag_marker.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                constraints:
                const BoxConstraints(minWidth: 100, maxWidth: 200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    InkWell(
                      child: Text(
                        widget.marker.tagMessengerId,
                        overflow: TextOverflow.fade,
                        softWrap: false,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0,
                        ),
                      ),
                      onTap: _launchInstagram,
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.0)),
                    Text(
                      'Position: ${widget.marker.marker.point.latitude}, ${widget.marker.marker.point.longitude}',
                      style: const TextStyle(fontSize: 12.0),
                    ),
                    Text(
                      '#маникюр #ногти',
                      style: const TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _launchInstagram() async {
    const nativeUrl = "instagram://user?username=lorem_ipsum_crlf";
    const webUrl = "https://www.instagram.com/lorem_ipsum_crlf/";
    try {
      await launchUrlString(nativeUrl, mode: LaunchMode.externalApplication);
    } catch (e) {
      print(e);
      await launchUrlString(webUrl, mode: LaunchMode.platformDefault);
    }
  }
}
