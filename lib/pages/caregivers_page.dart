
import 'package:flutter/material.dart';

import '../data/caregivers_data.dart';
import '../widgets/caregiver_card.dart';
import 'caregiver_details_page.dart';

class CaregiversPage extends StatelessWidget {
const CaregiversPage({super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
backgroundColor: const Color(0xFF5B4BDB),
foregroundColor: Colors.white,
elevation: 0,

leading: Builder(
builder: (context) {
return IconButton(
icon: const Icon(Icons.menu),
onPressed: () {
Scaffold.of(context).openDrawer();
},
);
},
),

title: const Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
'AmigoPet',
style: TextStyle(
fontWeight: FontWeight.bold,
fontSize: 21,
),
),
Text(
'Cuidadores perto de você',
style: TextStyle(
fontSize: 12,
fontWeight: FontWeight.normal,
),
),
],
),

actions: [
PopupMenuButton<String>(
icon: const Icon(Icons.tune),
onSelected: (value) {
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(
content: Text('Ordenação: $value'),
),
);
},
itemBuilder: (context) => const [
PopupMenuItem(
value: 'Mais próximos',
child: Text('Mais próximos'),
),
PopupMenuItem(
value: 'Melhor avaliados',
child: Text('Melhor avaliados'),
),
PopupMenuItem(
value: 'Menor preço',
child: Text('Menor preço'),
),
],
),
],
),

drawer: Drawer(
child: SafeArea(
child: Column(
children: [
Container(
width: double.infinity,
padding: const EdgeInsets.all(24),
color: const Color(0xFF5B4BDB),
child: const Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
CircleAvatar(
radius: 30,
backgroundColor: Colors.white,
child: Icon(
Icons.pets,
color: Color(0xFF5B4BDB),
size: 32,
),
),
SizedBox(height: 14),
Text(
'Olá, tutor! 🐾',
style: TextStyle(
color: Colors.white,
fontSize: 20,
fontWeight: FontWeight.bold,
),
),
SizedBox(height: 4),
Text(
'Encontre o cuidado ideal para seu pet.',
style: TextStyle(
color: Colors.white70,
),
),
],
),
),

ListTile(
leading: const Icon(Icons.people_outline),
title: const Text('Cuidadores'),
selected: true,
selectedColor: const Color(0xFF5B4BDB),
onTap: () {
Navigator.pop(context);
},
),

ListTile(
leading: const Icon(Icons.calendar_month_outlined),
title: const Text('Meus agendamentos'),
onTap: () {
Navigator.pop(context);
},
),

ListTile(
leading: const Icon(Icons.settings_outlined),
title: const Text('Configurações'),
onTap: () {
Navigator.pop(context);
},
),
],
),
),
),

body: ListView.builder(
padding: const EdgeInsets.all(16),
itemCount: caregivers.length,
itemBuilder: (context, index) {
final caregiver = caregivers[index];

return CaregiverCard(
caregiver: caregiver,
onTap: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (_) => CaregiverDetailsPage(
caregiver: caregiver,
),
),
);
},
);
},
),
);
}
}

