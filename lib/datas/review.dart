import 'dart:math';

import 'package:e_commerce/models/review.dart';

String _getMonthName(int monthNumber) {
  switch (monthNumber) {
    case 1:
      return 'Januari';
    case 2:
      return 'Februari';
    case 3:
      return 'Maret';
    case 4:
      return 'April';
    case 5:
      return 'Mei';
    case 6:
      return 'Juni';
    case 7:
      return 'Juli';
    case 8:
      return 'Agustus';
    case 9:
      return 'September';
    case 10:
      return 'Oktober';
    case 11:
      return 'November';
    case 12:
      return 'Desember';
    default:
      return '';
  }
}

Random random = Random();
int monthNumber = random.nextInt(12) + 1; // Angka acak antara 1 dan 12
int dayNumber = random.nextInt(31) + 1; // Angka acak antara 1 dan 31

String monthName = _getMonthName(monthNumber);
String randomDate = '$monthName $dayNumber';

List<Review> review = [
  Review(
      name: "Yelena Belova",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      date: randomDate,
      avatar: "avatar-1",
      starCount: 2),
  Review(
      name: "Stephen Strange",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      date: randomDate,
      avatar: "avatar-2",
      starCount: 5),
  Review(
      name: "Peter Parker",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      date: randomDate,
      avatar: "avatar-1",
      starCount: 4),
];
