import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
 
class NearbyPage extends StatefulWidget {
  const NearbyPage({super.key});
 
  @override
  State<NearbyPage> createState() => _NearbyPageState();
}
 
class _NearbyPageState extends State<NearbyPage> {
  List<DocumentSnapshot>? locations = null;
  String imageUrl = '';
 
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
 
  String? placename;
  String? place_img;
 
  void setPlaceInfo(String name, String image) {
    placename = name;
    place_img = image;
  }
 
 
  Future<void> _addToFavorite() async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var currentUser = _auth.currentUser;
  CollectionReference _collectionRef = FirebaseFirestore.instance.collection('users');
  await _collectionRef.doc(currentUser!.email).collection('favoriteLocations').add({
    'placename': placename,
    'place_img': place_img,
  });
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
                      // color: Colors.blue,
                      height: 200.0,
                      width: double.infinity, // ให้รูปภาพเต็มความกว้าง
                      child: Image.network(placeImgUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                      onPressed: () {
                        _addToFavorite();
                      },
                      icon: Icon(Icons.favorite),
                      color: Colors.red,
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
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => InfoPage()),
                            // );
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
 