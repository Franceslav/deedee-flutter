import 'package:flutter/material.dart';

class TopicWidget extends StatelessWidget {
  final List<Map> topicTitle;
  final VoidCallback? onTap;

  const TopicWidget({Key? key, required this.topicTitle, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: GridView.builder(
        itemCount: topicTitle.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: onTap,
            highlightColor: Colors.blue.withOpacity(0.4),
            splashColor: Colors.green.withOpacity(0.4),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              height: 150,
              width: MediaQuery.of(context).size.width / 3,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.deepPurple,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: topicTitle[index]["color"],
                        shape: BoxShape.circle),
                  ),
                  const Spacer(),
                  Text(
                    topicTitle[index]["title"],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
