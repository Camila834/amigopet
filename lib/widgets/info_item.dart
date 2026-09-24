
import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
final IconData icon;
final Color iconColor;
final String title;
final String subtitle;

const InfoItem({
super.key,
required this.icon,
required this.iconColor,
required this.title,
required this.subtitle,
});

@override
Widget build(BuildContext context) {
return Column(
children: [
Icon(
icon,
color: iconColor,
size: 22,
),
const SizedBox(height: 5),
Text(
title,
style: const TextStyle(
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 2),
Text(
subtitle,
style: const TextStyle(
color: Colors.grey,
fontSize: 11,
),
),
],
);
}
}

