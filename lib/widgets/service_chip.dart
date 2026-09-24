
import 'package:flutter/material.dart';

class ServiceChip extends StatelessWidget {
final IconData icon;
final String label;

const ServiceChip({
super.key,
required this.icon,
required this.label,
});

@override
Widget build(BuildContext context) {
return Chip(
avatar: Icon(
icon,
size: 17,
color: const Color(0xFF5B4BDB),
),
label: Text(label),
backgroundColor: const Color(0xFFEDEBFF),
side: BorderSide.none,
);
}
}
