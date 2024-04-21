import 'dart:developer';
 
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:chill_app/pages/home_livemap.dart';
 
class HomeSwipe extends StatefulWidget {
  @override
  State<HomeSwipe> createState() => _HomeSwipeState();
}
 
class _HomeSwipeState extends State<HomeSwipe> {
  List<DocumentSnapshot>? locations = null;
  String imageUrl = '';
  late MatchEngine _matchEngine;
  int numberPhotos = 6;
  int currentPhotoIndex = 0;
 
  @override
  void initState() {
    super.initState();
    fetchImageUrl();
    fetchLocations();
    _matchEngine = MatchEngine(swipeItems: items);
  }
 
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
 
  // GlobalKey<FormState> key = GlobalKey();
 
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
    final snapshot = await FirebaseFirestore.instance.collection('locations').get();
    // Store the documents in the 'locations' list
    locations = snapshot.docs;
    // Update the state to rebuild the UI with fetched data
    setState(() {});
  }
 
  Future<void> _addToFavorite(String name, String image) async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var currentUser = _auth.currentUser;
  CollectionReference _collectionRef = FirebaseFirestore.instance.collection('users');
  await _collectionRef.doc(currentUser!.email).collection('favoriteLocations').add({
    'placename': name,
    'place_img': image,
  });
}
 
 
 
  final _controller = PageController(
    initialPage: 0,
  );
 
  List<SwipeItem> items = [
    SwipeItem(
      // content: 'Library and Knowledge Center',
      likeAction: () {
        // _addToFavorite(placeName, placeImgUrl);
        log('Like');
      },
      nopeAction: () {
        log('Nope');
      },
    ),
    SwipeItem(
      // content: 'Mahidol Learning Center (MLC)',
      likeAction: () {
        // _addToFavorite(placeName, placeImgUrl);
        log('Like');
      },
      nopeAction: () {
        log('Nope');
      },
    ),
    SwipeItem(
      // content: 'Innovative Space MUICT',
      likeAction: () {
        // _addToFavorite(placeName, placeImgUrl);
        log('Like');
      },
      nopeAction: () {
        log('Nope');
      },
    ),
    SwipeItem(
      // content: 'Cafe Amazon EN',
      likeAction: () {
        // _addToFavorite(placeName, placeImgUrl);
        log('Like');
      },
      nopeAction: () {
        log('Nope');
      },
    ),
    SwipeItem(
      // content: 'Bellinee’s at MLC',
      likeAction: () {
        // _addToFavorite(placeName, placeImgUrl);
        log('Like');
      },
      nopeAction: () {
        log('Nope');
      },
    ),
    SwipeItem(
      // content: 'True Coffee at 2 floor MLC',
      likeAction: () {
        // _addToFavorite(placeName, placeImgUrl);
        log('Like');
      },
      nopeAction: () {
        log('Nope');
      },
    ),
  ];
 
 
 
  @override
  Widget build(BuildContext context) {
    if (locations == null) {
      return Center(child: CircularProgressIndicator());
    }
 
    // ตรวจสอบว่ามีข้อมูลใน locations หรือไม่
  if (locations!.isEmpty) {
    return Center(child: Text('No data available'));
  }
 
    return Scaffold(
      body: SwipeCards(
        matchEngine: _matchEngine,
        upSwipeAllowed: true,
        onStackFinished: () {},
        itemBuilder: (context, index) {
          var location = locations![index];
          var placeName = location['placename'];
          var placeImgUrl = location['place_img'];
 
          return Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Hero(
                tag: 'imageJraa$index',
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(placeImgUrl)),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.center,
                            colors: [Colors.black, Colors.transparent]),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (currentPhotoIndex != 0) {
                                setState(() {
                                  currentPhotoIndex = currentPhotoIndex - 1;
                                });
                              }
                            },
                            child: Container(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (currentPhotoIndex < (numberPhotos - 1)) {
                                setState(() {
                                  currentPhotoIndex = currentPhotoIndex + 1;
                                });
                              }
                            },
                            child: Container(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white.withOpacity(
                                  0.3), // กำหนดสีพื้นหลังของกล่องข้อความ
                            ),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 5),
                                      Expanded(
                                        child: Text(
                                          placeName,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    // ทำการ route ไปยัง InfoPage()
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LiveMapPage()),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.white.withOpacity(0.3),
                                ),
                                padding: EdgeInsets.all(10),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.close_rounded,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    log('Nope');
                                  },
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.white.withOpacity(0.3),
                                ),
                                padding: EdgeInsets.all(10),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.favorite_rounded,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    _addToFavorite(placeName, placeImgUrl);
                                    log('Like');
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}