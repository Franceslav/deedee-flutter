import 'package:deedee/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class DeeDeeDeviderWidget extends StatelessWidget {
  const DeeDeeDeviderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        height: 1,
        width: MediaQuery.of(context).size.width,
        color: AppColors.lightgrey,
      ),
    );
  }
}
