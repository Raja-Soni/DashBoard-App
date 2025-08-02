import 'package:flutter/material.dart';

import 'custom_container.dart';
import 'custom_text.dart';

class CustomListTile extends StatelessWidget {
  final String titleName;
  final String subTitleName;
  final Icon rewardIcon;
  final Color iconBgColor;

  CustomListTile({
    super.key,
    required this.titleName,
    required this.subTitleName,
    required this.rewardIcon,
    this.iconBgColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CustomContainer(
        width: 60,
        height: 60,
        borderRadius: 10,
        backgroundColor: iconBgColor,
        child: rewardIcon,
      ),
      title: CustomText(text: titleName, textColor: Colors.black),
      subtitle: CustomText(
        textSize: 15,
        text: subTitleName,
        textColor: Colors.grey.shade700,
      ),
    );
  }
}
