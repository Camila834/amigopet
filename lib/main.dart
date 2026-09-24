
import 'package:flutter/material.dart';
import 'pages/caregivers_page.dart';
import '../models/caregiver.dart';
import '../widgets/caregiver_card.dart';

void main() {
runApp(const AmigoPetApp());
}

class AmigoPetApp extends StatelessWidget {
const AmigoPetApp({super.key});

@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'AmigoPet',
debugShowCheckedModeBanner: false,
theme: ThemeData(
colorScheme: ColorScheme.fromSeed(
seedColor: const Color(0xFF5B4BDB),
),
scaffoldBackgroundColor: const Color(0xFFF7F7FB),
useMaterial3: true,
),
home: const CaregiversPage(),
);
}
}
