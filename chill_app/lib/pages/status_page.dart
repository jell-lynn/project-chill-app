import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  List<DocumentSnapshot>? locations;
  String imageUrl = '';

  String? selectedItem = 'Status'; // เก็บค่า default สำหรับ Dropdown
  Map<String, String?> statusByLocation = {}; // เก็บสถานะของแต่ละสถานที่

  List<String> items = ['Status', 'Few', 'Normal', 'Many'];
  List<bool> toggleValues = [false, false, false, false, false, false];

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
    try {
      // Fetch data from Firestore collection 'locations'
      final snapshot =
          await FirebaseFirestore.instance.collection('locations').get();
      // Store the documents in the 'locations' list
      locations = snapshot.docs;
      // Update the state to rebuild the UI with fetched data
      setState(() {
        // Set initial status 'Status' for each location
        locations!.forEach((location) {
          statusByLocation[location.id] = 'Status';
        });
      });
    } catch (error) {
      print('Error fetching locations: $error');
    }
  }

  Color getColorByStatus(String status) {
    switch (status) {
      case 'Status':
        return Colors.white; // สีขาวสำหรับ 'Status'
      case 'Few':
        return Colors.green; // สีเขียวสำหรับ 'Few'
      case 'Normal':
        return Colors.yellow; // สีเหลืองสำหรับ 'Normal'
      case 'Many':
        return Colors.red; // สีแดงสำหรับ 'Many'
      default:
        return Colors.white; // สีขาวเป็นค่า default
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
                    "Status",
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
      body: locations == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: locations!.length,
              itemBuilder: (context, index) {
                var location = locations![index];
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
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Switch(
                                value: toggleValues[index],
                                onChanged: (newValue) {
                                  setState(() {
                                    toggleValues[index] = newValue;
                                  });
                                },
                                activeColor: Colors.green,
                                inactiveTrackColor: Color(0xFFD3D3D3),
                              ),
                              SizedBox(width: 20),
                              DropdownButton<String>(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                value: statusByLocation[location.id], // เลือกค่าสถานะของแต่ละสถานที่
                                items: items.map((item) {
                                  return DropdownMenuItem<String>(
                                    value: item,
                                    child: Row(
                                      children: [
                                        SizedBox(width: 10),
                                        Container(
                                           width: 20,
                                           height: 20,
                                           decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: getColorByStatus(item),
                                            ),
                                            ),
                                            SizedBox(width: 10),
                                            Text(item),
                                      ],
                                    ),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    statusByLocation[location.id] =
                                        newValue; // อัปเดตสถานะของแต่ละสถานที่เมื่อมีการเลือกค่าใหม่
                                  });
                                },
                                
                              ),
                            ],
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
