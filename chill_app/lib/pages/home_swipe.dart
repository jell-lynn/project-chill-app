import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class HomeSwipe extends StatefulWidget {
  @override
  State<HomeSwipe> createState() => _HomeSwipeState();
}

class _HomeSwipeState extends State<HomeSwipe> {
  late List<DocumentSnapshot> locations;
  String imageUrl = '';

  @override
  void initState() {
    super.initState();
    // Call the function to fetch the image URL
    fetchImageUrl();
  }

  GlobalKey<FormState> key = GlobalKey();
  // CollectionReference _reference = FirebaseFirestore.instance.collection("locations");

  Future<void> fetchImageUrl() async {
    // final picker = ImagePicker();
    // final pickedFile = await picker.getImage(source: ImageSource.gallery);

    // if (pickedFile ==null) return;
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

    // Get a reference to storage root
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('images');

    // Create a reference for the image to be stored
    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);

    try{
      // // Store the file
      // await referenceImageToUpload.putFile(File(pickedFile.path));
      // Success: get the download URL
      imageUrl = await referenceImageToUpload.getDownloadURL();
    } catch(error){

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('locations').snapshots(),
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
          if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No data available'),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var location = snapshot.data!.docs[index];
              var placeName = location['placename'];
              var placeImgUrl = location['place_img']; // Use the fetched image URL

              return ListTile(
                title: Text(placeName),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(placeImgUrl),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
