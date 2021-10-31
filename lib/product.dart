import 'package:flutter/material.dart';

class Product {
  String name;
  String price;
  String cover;
  List<String> imageAsset;
  List<String> availableSize;
  List<Color?> colors;

  Product({
    required this.name,
    required this.price,
    required this.cover,
    required this.availableSize,
    required this.imageAsset,
    required this.colors,
  });
}

List<Product> productList = [
  Product(
    name: "Jacket Jujutsu Kaisen",
    price: "Rp. 350.000",
    cover: 'images/jacket/jujutsu-front.jpg',
    availableSize: [
      'S','M','L','XL','XXL','XXXL',
    ],
    imageAsset: [
      'images/jacket/jujutsu-front.jpg',
      'images/jacket/jujutsu-back.jpg',
    ],
    colors: [
      Colors.black,
      Colors.white,
    ],
  ),
  Product(
      name: "Jacket Senku",
      price: 'Rp. 350.000',
      cover: 'images/jacket/senku-front.jpg',
      availableSize: [
        'S','M','L','XL','XXL','XXXL',
      ],
      imageAsset: [
        'images/jacket/senku-front.jpg',
        'images/jacket/senku-back.jpg',
      ],
    colors: [
      Colors.black,
      Colors.white,
    ],
  ),
  Product(
      name: "Jacket Tokyo Tower",
      price: 'Rp. 350.000',
      cover: 'images/jacket/tokyo-tower-front.jpg',
      availableSize: [
        'S','M','L','XL','XXL','XXXL',
      ],
      imageAsset: [
        'images/jacket/tokyo-tower-front.jpg',
        'images/jacket/tokyo-tower-back.jpg',
      ],
    colors: [
      Colors.black,
      Colors.white,
    ],
  ),
  Product(
      name: "Chino Pant",
      price: 'Rp. 300.000',
      cover: 'images/pant/chino.jpg',
      availableSize: [
        '28','29','30','31','32',
      ],
      imageAsset: [
        'images/pant/chino.jpg',
        'images/pant/chino-detail1.jpg',
        'images/pant/chino-detail2.jpg',
      ],
    colors: [
      Color(0xfff3d2ae),
      Color(0xff897256),
      Colors.black,
      Colors.white,
    ],
  ),
  Product(
      name: "J+ Pant",
      price: 'Rp. 300.000',
      cover: 'images/pant/j+.jpg',
      availableSize: [
        '28','29','30','31','32',
      ],
      imageAsset: [
        'images/pant/j+.jpg',
        'images/pant/j+-detail1.jpg',
        'images/pant/j+-detail2.jpg',
      ],
    colors: [
      Color(0xfff3d2ae),
      Color(0xff897256),
      Colors.black,
      Colors.white,
    ],
  ),
  Product(
      name: "Creation of Adam T-Shirt",
      price: 'Rp. 120.000',
      cover: 'images/shirt/adam-back.jpg',
      availableSize: [
        'S','M','L','XL','XXL','XXXL',
      ],
      imageAsset: [
        'images/shirt/adam-back.jpg',
        'images/shirt/adam-front.jpg',
        'images/shirt/adam-detail1.jpg',
        'images/shirt/adam-detail2.jpg',
        'images/shirt/adam-detail3.jpg'
      ],
    colors: [
      Color(0xff7d0814),
      Color(0xff0a1870),
      Colors.black,
      Colors.white,
    ],
  ),
  Product(
      name: "Fallen Angel T-Shirt",
      price: 'Rp. 120.000',
      cover: 'images/shirt/angel-back.jpg',
      availableSize: [
        'S','M','L','XL','XXL','XXXL',
      ],
      imageAsset: [
        'images/shirt/angel-back.jpg',
        'images/shirt/angel-front.jpg',
        'images/shirt/angel-detail1.jpg',
        'images/shirt/angel-detail2.jpg',
        'images/shirt/angel-detail3.jpg'
      ],
    colors: [
      Color(0xff7d0814),
      Color(0xff0a1870),
      Colors.black,
      Colors.white,
    ],
  ),
  Product(
      name: "Garden of Eden T-Shirt",
      price: 'Rp. 120.000',
      cover: 'images/shirt/eden-back.jpg',
      availableSize: [
        'S','M','L','XL','XXL','XXXL',
      ],
      imageAsset: [
        'images/shirt/eden-back.jpg',
        'images/shirt/eden-front.jpg',
        'images/shirt/eden-detail1.jpg',
        'images/shirt/eden-detail2.jpg',
        'images/shirt/eden-detail3.jpg'
      ],
    colors: [
      Color(0xff7d0814),
      Color(0xff0a1870),
      Colors.black,
      Colors.white,
    ],
  ),
];