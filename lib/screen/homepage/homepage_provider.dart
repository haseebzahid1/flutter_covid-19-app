import 'package:flutter/material.dart';
import 'package:flutter_covid_19_app/model/symptoms.dart';

class Symptoms extends ChangeNotifier {
  List<Product> demoProducts = [
    Product(
      images: "assets/images/headache.png",
      title: "Headache",
    ), Product(
      images: "assets/images/caugh.png",
      title: "Caugh",
    ), Product(
      images: "assets/images/fever.png",
      title: "Fever",
    ),
  ];
}