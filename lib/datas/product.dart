import 'dart:math';

import 'package:e_commerce/models/featured_product.dart';

List<Product> featuredProduct = [
  Product(
      availability: Random().nextInt(1000),
      nameProduct: "TMA-2 HD Wireless",
      price: 1000000,
      review: 86,
      rating: 4.8,
      image: "cable"),
  Product(
      availability: Random().nextInt(1000),
      nameProduct: "TMA-2 HD Wireless",
      price: 1500000,
      review: 86,
      rating: 4.7,
      image: "headphone"),
  Product(
      availability: Random().nextInt(1000),
      nameProduct: "TMA-2 HD Wireless",
      price: 2500000,
      review: 90,
      rating: 5.0,
      image: "cable"),
];

List<Product> newArrivals = [
  Product(
    availability: Random().nextInt(1000),
    nameProduct: "Cable HDMI",
    price: 12000,
    image: "cable",
    review: 22,
    rating: 4.8,
  ),
  Product(
    availability: Random().nextInt(1000),
    nameProduct: "Drill For Wood",
    price: 10000,
    image: "drill",
    review: 10,
    rating: 4.2,
  ),
  Product(
    availability: Random().nextInt(1000),
    nameProduct: "Cable For Headphone",
    price: 22000,
    image: "cable",
    review: 21,
    rating: 5.0,
  ),
  Product(
    availability: Random().nextInt(1000),
    nameProduct: "Headphone Sony",
    price: 900000,
    image: "headphone",
    review: 2,
    rating: 4.9,
  ),
];

List<Product> bestSeller = [
  Product(
      availability: Random().nextInt(1000),
      nameProduct: "Sony Headphone",
      price: 8000000,
      review: 90,
      rating: 4.2,
      image: "headphone"),
  Product(
      availability: Random().nextInt(1000),
      nameProduct: "Beats Headphone HD",
      price: 2500000,
      review: 26,
      rating: 4.9,
      image: "drill"),
  Product(
      availability: Random().nextInt(1000),
      nameProduct: "Cable Wireless",
      price: 500000,
      review: 10,
      rating: 4.0,
      image: "cable"),
];

List<Product> specialOffer = [
  Product(
    availability: Random().nextInt(1000),
    nameProduct: "Drill Wireless",
    price: 134000,
    image: "drill",
    review: 80,
    rating: 4.0,
    sale: true,
  ),
  Product(
    availability: Random().nextInt(1000),
    nameProduct: "Cable",
    price: 125000,
    image: "cable",
    review: 20,
    rating: 5.0,
    sale: true,
  ),
  Product(
    availability: Random().nextInt(1000),
    nameProduct: "Drill",
    price: 12000,
    image: "drill",
    review: 10,
    rating: 4.0,
    sale: true,
  ),
];
List<Product> topRatedProduct = [
  Product(
    availability: Random().nextInt(1000),
    nameProduct: "Headphoone",
    price: 134000,
    image: "headphone",
    review: 50,
    rating: 5.0,
  ),
  Product(
    availability: Random().nextInt(1000),
    nameProduct: "Cable",
    price: 125000,
    image: "cable",
    review: 20,
    rating: 5.0,
  ),
  Product(
    availability: Random().nextInt(1000),
    nameProduct: "Drill",
    price: 10000,
    image: "drill",
    review: 10,
    rating: 4.0,
  ),
];
