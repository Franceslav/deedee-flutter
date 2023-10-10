import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class UserFeedbackPage extends StatelessWidget {
  const UserFeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(locale.reviews),
      ),
      body: const _Feedbacks()
    );
  }
}


class _Feedbacks extends StatelessWidget {
  const _Feedbacks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: MediaQuery.of(context).size.height * 0.35,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.grey[200],
            child: ListTile(title: Text('Отзыв ${index + 1}')),
          );
        },
      ),
    );
  }
}