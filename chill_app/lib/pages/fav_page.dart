import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
 
class favPage extends StatefulWidget {
  const favPage({super.key});
 
  @override
  State<favPage> createState() => _favPageState();
}
 
class _favPageState extends State<favPage> {
  List<DocumentSnapshot>? locations;
  String imageUrl = '';
  final currentUser = FirebaseAuth.instance.currentUser;
 
  @override
  void initState() {
    super.initState();
    // Call the function to fetch the image URL
    fetchImageUrl();
    fetchLocations();
  }
 
  Future<void> fetchImageUrl() async {
    try {
      String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
      // Get a reference to storage root
      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImages = referenceRoot.child('images');
      // Create a reference for the image to be stored
      Reference referenceImageToUpload =
          referenceDirImages.child(uniqueFileName);
      // Success: get the download URL
      imageUrl = await referenceImageToUpload.getDownloadURL();
    } catch (error) {
      print('Error fetching image URL: $error');
    }
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
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    scale: 35,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Let’s Chill',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Favorite",
                    style: TextStyle(
                        color: Color(0xFF3F3F3F),
                        fontWeight: FontWeight.bold,
                        fontSize: 28),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: StreamBuilder(
  stream: FirebaseFirestore.instance
    .collection('users')
    .doc(currentUser!.email)
    .collection('favoriteLocations')
    .snapshots(),
  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if (snapshot.hasError) {
      return Center(
        child: Text('Error: ${snapshot.error}'),
      );
    }
    return ListView.builder(
      itemCount: snapshot.data!.docs.length,
      itemBuilder: (context, index) {
        var location = snapshot.data!.docs[index];
        var placeName = location['placename'];
        var placeImgUrl = location['place_img'];
        return Card(
          elevation: 3,
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(placeImgUrl),
                radius: 40, // Increase the radius of the CircleAvatar
              ),
              title: Text(
                placeName,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold), // Increase font size
              ),
              trailing: IconButton(
  onPressed: () {
    // ตรวจสอบสถานะการ fav และเรียกใช้ฟังก์ชันที่เหมาะสม
    if (location['isFavorited'] == true) {
      _removeToFavorite(location.id);
    } else {
      _addToFavorite(placeName, placeImgUrl);
    }
  },
  icon: Icon(
    location['isFavorited'] == true ? Icons.favorite : Icons.favorite_border,
    color: location['isFavorited'] == true ? Colors.red : null,
  ),
),
            ),
          ),
        );
      },
    );
  },
),
    );
  }
}