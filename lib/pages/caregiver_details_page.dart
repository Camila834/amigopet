
import 'package:flutter/material.dart';

import '../models/caregiver.dart';
import '../widgets/info_item.dart';
import '../widgets/service_chip.dart';

class CaregiverDetailsPage extends StatelessWidget {
final Caregiver caregiver;

const CaregiverDetailsPage({
super.key,
required this.caregiver,
});

void _showCancelDialog(BuildContext context) {
showDialog(
context: context,
builder: (context) {
return AlertDialog(
title: const Text('Cancelar agendamento?'),
content: const Text(
'Tem certeza de que deseja cancelar este agendamento? '
'Essa ação não poderá ser desfeita.',
),
actions: [
TextButton(
onPressed: () => Navigator.pop(context),
child: const Text('Voltar'),
),
FilledButton(
style: FilledButton.styleFrom(
backgroundColor: Colors.red,
),
onPressed: () {
Navigator.pop(context);

ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text('Agendamento cancelado.'),
),
);
},
child: const Text('Cancelar agendamento'),
),
],
);
},
);
}

void _showServiceDialog(BuildContext context) {
showDialog(
context: context,
builder: (context) {
return SimpleDialog(
title: const Text('Tipo de serviço'),
children: [
SimpleDialogOption(
onPressed: () {
Navigator.pop(context);
_selectService(context, 'Passeio');
},
child: const Text('Passeio'),
),
SimpleDialogOption(
onPressed: () {
Navigator.pop(context);
_selectService(context, 'Hospedagem');
},
child: const Text('Hospedagem'),
),
SimpleDialogOption(
onPressed: () {
Navigator.pop(context);
_selectService(context, 'Banho e tosa');
},
child: const Text('Banho e tosa'),
),
],
);
},
);
}

void _selectService(BuildContext context, String service) {
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(
content: Text('Serviço selecionado: $service'),
),
);
}

void _showMoreOptions(BuildContext context) {
showModalBottomSheet(
context: context,
showDragHandle: true,
shape: const RoundedRectangleBorder(
borderRadius: BorderRadius.vertical(
top: Radius.circular(24),
),
),
builder: (context) {
return SafeArea(
child: Padding(
padding: const EdgeInsets.only(
left: 16,
right: 16,
bottom: 24,
),
child: Column(
mainAxisSize: MainAxisSize.min,
children: [
ListTile(
leading: const Icon(Icons.share_outlined),
title: const Text('Compartilhar perfil'),
onTap: () {
Navigator.pop(context);

ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text('Compartilhamento iniciado.'),
),
);
},
),
ListTile(
leading: const Icon(
Icons.flag_outlined,
color: Colors.red,
),
title: const Text('Denunciar'),
onTap: () {
Navigator.pop(context);

ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text('Perfil denunciado.'),
),
);
},
),
],
),
),
);
},
);
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
backgroundColor: const Color(0xFF5B4BDB),
foregroundColor: Colors.white,
elevation: 0,

leading: IconButton(
icon: const Icon(Icons.arrow_back),
onPressed: () => Navigator.pop(context),
),

title: const Text(
'Perfil do cuidador',
style: TextStyle(
fontWeight: FontWeight.bold,
),
),

actions: [
IconButton(
icon: const Icon(Icons.more_vert),
onPressed: () {
_showMoreOptions(context);
},
),
],
),

body: SingleChildScrollView(
padding: const EdgeInsets.all(20),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Center(
child: CircleAvatar(
radius: 58,
backgroundImage: NetworkImage(
caregiver.imageUrl,
),
),
),

const SizedBox(height: 16),

Center(
child: Text(
caregiver.name,
style: const TextStyle(
fontSize: 25,
fontWeight: FontWeight.bold,
),
),
),

const SizedBox(height: 6),

Center(
child: Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
const Icon(
Icons.location_on_outlined,
color: Colors.grey,
),
const SizedBox(width: 4),
Text(
caregiver.location,
style: const TextStyle(
color: Colors.grey,
),
),
],
),
),

const SizedBox(height: 18),

Container(
padding: const EdgeInsets.all(16),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(16),
),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceAround,
children: [
InfoItem(
icon: Icons.star,
iconColor: Colors.amber,
title: '${caregiver.rating}',
subtitle: 'Avaliação',
),
InfoItem(
icon: Icons.rate_review_outlined,
iconColor: const Color(0xFF5B4BDB),
title: '${caregiver.reviews}',
subtitle: 'Avaliações',
),
InfoItem(
icon: Icons.pets,
iconColor: Colors.teal,
title: caregiver.price,
subtitle: 'A partir de',
),
],
),
),

const SizedBox(height: 28),

const Text(
'Sobre o cuidador',
style: TextStyle(
fontSize: 19,
fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 10),

Text(
caregiver.description,
style: const TextStyle(
fontSize: 15,
height: 1.5,
),
),

const SizedBox(height: 28),

const Text(
'Serviços',
style: TextStyle(
fontSize: 19,
fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 12),

Wrap(
spacing: 8,
runSpacing: 8,
children: const [
ServiceChip(
icon: Icons.directions_walk,
label: 'Passeios',
),
ServiceChip(
icon: Icons.home_outlined,
label: 'Hospedagem',
),
ServiceChip(
icon: Icons.content_cut,
label: 'Banho e tosa',
),
],
),

const SizedBox(height: 32),

SizedBox(
width: double.infinity,
child: OutlinedButton.icon(
onPressed: () {
_showServiceDialog(context);
},
icon: const Icon(Icons.pets),
label: const Text('Tipo de serviço'),
style: OutlinedButton.styleFrom(
padding: const EdgeInsets.symmetric(
vertical: 16,
),
),
),
),

const SizedBox(height: 12),

SizedBox(
width: double.infinity,
child: FilledButton(
onPressed: () {
_showCancelDialog(context);
},
style: FilledButton.styleFrom(
backgroundColor: Colors.red.shade600,
padding: const EdgeInsets.symmetric(
vertical: 16,
),
),
child: const Text('Cancelar agendamento'),
),
),

const SizedBox(height: 12),

SizedBox(
width: double.infinity,
child: TextButton.icon(
onPressed: () {
_showMoreOptions(context);
},
icon: const Icon(Icons.more_horiz),
label: const Text('Mais opções'),
),
),
],
),
),
);
}
}

