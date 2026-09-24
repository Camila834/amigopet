
import 'package:flutter/material.dart';
import '../models/caregiver.dart';

class CaregiverCard extends StatelessWidget {
final Caregiver caregiver;
final VoidCallback onTap;

const CaregiverCard({
super.key,
required this.caregiver,
required this.onTap,
});

@override
Widget build(BuildContext context) {
return Card(
margin: const EdgeInsets.only(bottom: 14),
elevation: 0,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(18),
),
child: InkWell(
borderRadius: BorderRadius.circular(18),
onTap: onTap,
child: Padding(
padding: const EdgeInsets.all(14),
child: Row(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
CircleAvatar(
radius: 34,
backgroundImage: NetworkImage(caregiver.imageUrl),
),
const SizedBox(width: 14),

Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
caregiver.name,
style: const TextStyle(
fontSize: 17,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 4),

Row(
children: [
const Icon(
Icons.location_on_outlined,
size: 15,
color: Colors.grey,
),
const SizedBox(width: 3),
Text(
caregiver.location,
style: const TextStyle(color: Colors.grey),
),
],
),

const SizedBox(height: 8),

Row(
children: [
const Icon(
Icons.star,
color: Colors.amber,
size: 18,
),
const SizedBox(width: 4),
Text(
'${caregiver.rating}',
style: const TextStyle(
fontWeight: FontWeight.bold,
),
),
const SizedBox(width: 4),
Text(
'(${caregiver.reviews})',
style: const TextStyle(color: Colors.grey),
),
],
),

const SizedBox(height: 8),

Text(
caregiver.service,
style: const TextStyle(
color: Color(0xFF5B4BDB),
fontWeight: FontWeight.w600,
),
),

const SizedBox(height: 4),

Text(
caregiver.price,
style: const TextStyle(
fontWeight: FontWeight.bold,
),
),
],
),
),

const Icon(
Icons.chevron_right,
color: Colors.grey,
),
],
),
),
),
);
}
}

