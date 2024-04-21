import 'package:flutter/material.dart';

class LocationData {
  final String name;
  final List<String> images; // เปลี่ยนจาก String เป็น List<String>
  final List<IconData> icons;
  final List<String> iconTexts;
  final double latitude;
  final double longitude;

  LocationData({
    required this.name,
    required this.images, // แก้ให้รับ List<String> แทน
    required this.icons,
    required this.iconTexts,
    required this.latitude,
    required this.longitude,
  });
}

List<LocationData> locations = [
  LocationData(
    name: 'Bellinee',
    images: ['bellinee_1.png', 'bellinee_2.png', 'bellinee_3.png', 'bellinee_4.png'],
    icons: [Icons.wifi, Icons.power_off_outlined, Icons.wc, Icons.air],
    iconTexts: [
      'Free WiFi Only for Mahidol Students',
      'Not enough wall outlets',
      'Toilet',
      'Air Conditioner'
    ],
    latitude: 13.79637471595359,
    longitude: 100.32080444719125,
  ),
  LocationData(
    name: 'Cafe Amazon at EN',
    images: ['cafe-en_1.png', 'cafe-en_2.png', 'cafe-en_3.png', 'cafe-en_4.png'],
    icons: [Icons.wifi, Icons.power_off_outlined, Icons.wc, Icons.air],
    iconTexts: [
      'Free WiFi Only for Mahidol Students',
      'Not enough wall outlets',
      'Toilet',
      'Air Conditioner'
    ],
    latitude: 13.794983102492157,
    longitude: 100.32160407261496,
  ),
  LocationData(
    name: 'Innovative Space at ICT Mahidol',
    images: ['ict_1.png', 'ict_2.png', 'ict_3.png', 'ict_4.png'],
    icons: [Icons.wifi, Icons.power, Icons.wc, Icons.air],
    iconTexts: [
      'Free WiFi Only for Mahidol Students',
      'Enough Wall outlets',
      'Toilet',
      'Air Conditioner'
    ],
    latitude: 13.794411604190131,
    longitude: 100.32472573192501,
  ),
  LocationData(
    name: 'Library and Knowledge Center',
    images: ['library_1.png', 'library_2.png', 'library_3.png', 'library_4.png'],
    icons: [
      Icons.wifi,
      Icons.power_off_outlined,
      Icons.volume_off_sharp,
      Icons.wc,
      Icons.air
    ],
    iconTexts: [
      'Free WiFi Only for Mahidol Students',
      'Not Enough Wall outlets',
      'Quiet Zone Floor 2',
      'Toilet',
      'Air Conditioner'
    ],
    latitude: 13.794463701133086,
    longitude: 100.32410547109401,
  ),
  LocationData(
    name: 'Mahidol Learning Center (MLC)',
    images: ['mlc_1.png', 'mlc_2.png', 'mlc_3.png', 'mlc_4.png'],
    icons: [Icons.wifi, Icons.power_off_outlined, Icons.wc],
    iconTexts: [
      'Free WiFi Only for Mahidol Students',
      'Not Enough Wall outlets',
      'Toilet'
    ],
    latitude: 13.794016707620859,
    longitude: 100.32127148805849,
  ),
  LocationData(
    name: 'True Coffee at MLC',
    images: ['truecoffee_1.png', 'truecoffee_2.png', 'truecoffee_3.png', 'truecoffee_4.png'],
    icons: [Icons.wifi, Icons.power_off_outlined, Icons.wc, Icons.air],
    iconTexts: [
      'Free WiFi Only for Mahidol Students',
      'Not enough wall outlets',
      'Toilet',
      'Air Conditioner'
    ],
    latitude: 13.794426782587541,
    longitude: 100.32137330620937,
  ),
];
