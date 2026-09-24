import 'package:flutter/material.dart';

class Caregiver {
final String name;
final String location;
final double rating;
final int reviews;
final String service;
final String price;
final String description;
final String imageUrl;

const Caregiver({
required this.name,
required this.location,
required this.rating,
required this.reviews,
required this.service,
required this.price,
required this.description,
required this.imageUrl,
});
}
