import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chill_app/pages/home_livemap.dart';

class NearbyPage extends StatefulWidget {
  const NearbyPage({super.key});

  @override
  State<NearbyPage> createState() => _NearbyPageState();
}

class _NearbyPageState extends State<NearbyPage> {
  List<DocumentSnapshot>? locations = null;
  String imageUrl = '';
  Map<String, bool> favoriteStatus = {};

  @override
  void initState() {
    super.initState();
    fetchImageUrl();
    fetchLocations();
  }

  Future<void> fetchImageUrl() async {
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

    // Get a reference to storage root
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('images');

    // Create a reference for the image to be stored
    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);

    try {
      imageUrl = await referenceImageToUpload.getDownloadURL();
    } catch (error) {}
  }

  Future<void> fetchLocations() async {
    // Fetch data from Firestore collection 'locations'
    final snapshot =
        await FirebaseFirestore.instance.collection('locations').get();
    // Store the documents in the 'locations' list
    locations = snapshot.docs;
    // Update the state to rebuild the UI with fetched data
    setState(() {});
  }


Future<bool> _addToFavorite(String name, String image) async {
  try {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef = FirebaseFirestore.instance.collection('users');
    // เพิ่มสถานที่โปรดพร้อมกับข้อมูลเกี่ยวกับการ fav
    await _collectionRef.doc(currentUser!.email).collection('favoriteLocations').add({
      'placename': name,
      'place_img': image,
      'isFavorited': true, // เพิ่มค่า isFavorited เป็น true เพื่อแสดงว่าเป็นสถานที่โปรด
    });
    return true; // ส่งค่าเป็น true เมื่อการเพิ่มสถานที่เข้ารายการโปรดสำเร็จ
  } catch (error) {
    print('Error adding location to favorites: $error');
    return false; // ส่งค่าเป็น false เมื่อเกิดข้อผิดพลาด
  }
}

Future<bool> _removeToFavorite(String documentId) async {
  try {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef = FirebaseFirestore.instance.collection('users');
    // ลบสถานที่โปรดออกจากรายการพร้อมกับข้อมูลเกี่ยวกับการ fav
    await _collectionRef.doc(currentUser!.email).collection('favoriteLocations').doc(documentId).delete();
    return true; // ส่งค่าเป็น true เมื่อการเพิ่มสถานที่เข้ารายการโปรดสำเร็จ
  } catch (error) {
    print('Error removing location to favorites: $error');
    return false; // ส่งค่าเป็น false เมื่อเกิดข้อผิดพลาด
  }
}



  @override
  Widget build(BuildContext context) {
    if (locations == null) {
      return Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            var location = locations![index];
            var placeName = location['placename'];
            var placeImgUrl = location['place_img'];

            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [

    ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      ),
      child: Container(
        height: 200.0,
        width: double.infinity, // ให้รูปภาพเต็มความกว้าง
        child: Image.network(
          placeImgUrl,
          fit: BoxFit.cover,
        ),
      ),
    ),
    Positioned(
      top: 10,
      right: 10,
      child: IconButton(
        onPressed: () {
          setState(() {
            // ตรวจสอบสถานะของสถานที่ที่ถูกกด
            bool currentStatus = favoriteStatus[placeName] ?? false;
            // เปลี่ยนสถานะของสถานที่ที่ถูกกด
            favoriteStatus[placeName] = !currentStatus;
            if (favoriteStatus[placeName]!) {
              // ถ้าเป็น true ให้เพิ่มสถานที่เข้ารายการโปรด
              _addToFavorite(placeName, placeImgUrl);
            } else {
              // ถ้าเป็น false ให้ลบสถานที่ออกจากรายการโปรด
              _removeToFavorite(location.id);
            }
          });
        },
        icon: Icon(
          // ใช้สถานะที่เก็บไว้เพื่อกำหนด icon และสี
          favoriteStatus[placeName] ?? false ? Icons.favorite : Icons.favorite_border,
          color: favoriteStatus[placeName] ?? false ? Colors.red : null,
        ),
      ),
    ),
    Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            placeName,
            style: TextStyle(fontSize: 20.0),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LiveMapPage()),
              );
            },
            icon: Icon(Icons.arrow_forward),
          ),
        ],
      ),
    ),
  ],
),
            );
          },
        ),
      ),
    );
  }
}
