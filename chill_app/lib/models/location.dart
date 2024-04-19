import 'package:flutter/material.dart';

class LocationData {
  final String name;
  final List<String> imagePaths;
  final List<IconData> icons; 
  final List<String> iconTexts; 

  LocationData({
    required this.name,
    required this.imagePaths,
    required this.icons,
    required this.iconTexts,
  });
}

LocationData Bellinee = LocationData(
  name: 'Bellinee',
  imagePaths: [
    'assets/bellinee_1.HEIC',
    'assets/bellinee_2.HEIC',
    'assets/bellinee_3.HEIC',
    'assets/bellinee_4.HEIC',
  ],
  icons: [Icons.wifi, Icons.power_off_outlined, Icons.wc, Icons.air],
  iconTexts: ['Free WiFi Only Mahidol Student', 'Not enough wall outlets', 'Toilet', 'Air Conditioner'],
);

LocationData cafeEN = LocationData(
  name: 'Cafe Amazon EN',
  imagePaths: [
    'assets/cafe-en_1.HEIC',
    'assets/cafe-en_2.HEIC',
    'assets/cafe-en_3.HEIC',
    'assets/cafe-en_4.HEIC',
  ],
  icons: [Icons.wifi, Icons.power_off_outlined, Icons.wc, Icons.air],
  iconTexts: ['Free WiFi Only Mahidol Student', 'Not enough wall outlets', 'Toilet', 'Air Conditioner'],
);

LocationData ict = LocationData(
  name: 'Innovative Space MUICT',
  imagePaths: [
    'assets/ict_1.HEIC',
    'assets/ict_2.HEIC',
    'assets/ict_3.HEIC',
    'assets/ict_4.HEIC',
  ],
  icons: [Icons.wifi, Icons.power, Icons.wc, Icons.air],
  iconTexts: ['Free WiFi Only Mahidol Student', 'Enough Wall outlets', 'Toilet', 'Air Conditioner'],
);

LocationData library = LocationData(
  name: 'Innovative Space MUICT',
  imagePaths: [
    'assets/library_1.HEIC',
    'assets/library-2.HEIC',
    'assets/library_3.HEIC',
    'assets/library_4.HEIC',
  ],
  icons: [Icons.wifi, Icons.power_off_outlined, Icons.volume_off_sharp, Icons.wc, Icons.air],
  iconTexts: ['Free WiFi Only Mahidol Student', 'Not Enough Wall outlets', 'Quite Zone Floor 2', 'Toilet', 'Air Conditioner'],
);

LocationData mlc = LocationData(
  name: 'Mahidol Learning Center (MLC)',
  imagePaths: [
    'assets/mlc_1.HEIC',
    'assets/mlc_2.HEIC',
    'assets/mlc_3.HEIC',
    'assets/mlc_4.HEIC',
  ],
  icons: [Icons.wifi, Icons.power_off_outlined, Icons.wc],
  iconTexts: ['Free WiFi Only Mahidol Student', 'Not Enough Wall outlets', 'Toilet'],
);

LocationData trueCoffee = LocationData(
  name: 'True Coffee',
  imagePaths: [
    'assets/trueCoffee_1.HEIC',
    'assets/trueCoffee_2.HEIC',
    'assets/trueCoffee_3.HEIC',
    'assets/trueCoffee_4.HEIC',
  ],
  icons: [Icons.wifi, Icons.power_off_outlined, Icons.wc, Icons.air],
  iconTexts: ['Free WiFi Only Mahidol Student', 'Not enough wall outlets', 'Toilet', 'Air Conditioner'],
);