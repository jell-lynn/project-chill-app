import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
 
import 'package:chill_app/models/locations.dart';
 
class LiveMapPage extends StatefulWidget {
  const LiveMapPage({Key? key}) : super(key: key);
 
  @override
  State<LiveMapPage> createState() => _LiveMapPageState();
}
 
class _LiveMapPageState extends State<LiveMapPage> {
  int _selectedIndex = 2; // Initial tab index for LiveMap
 
  late GoogleMapController _googleMapController;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          Container( // Placeholder for Swipe page
            color: Colors.white,
            child: Center(
              child: Text('Swipe Page Content'),
            ),
          ),
          Container( // Placeholder for Nearby page
            color: Colors.white,
            child: Center(
              child: Text('Nearby Page Content'),
            ),
          ),
          _buildLiveMapPage(), // LiveMap content
        ],
      ),
    );
  }
 
  Widget _buildTabButton(int index, String label) {
    return TextButton(
      onPressed: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Text(
        label,
        style: TextStyle(
          fontWeight: _selectedIndex == index ? FontWeight.bold : FontWeight.normal,
          fontSize: 20,
          decoration: _selectedIndex == index ? TextDecoration.underline : TextDecoration.none,
          color: _selectedIndex == index ? Color(0xFF172B4D) : Color(0xFF666666),
        ),
      ),
    );
  }
 
  Widget _buildLiveMapPage() {
    return Stack(
      children: <Widget>[
        GoogleMap(
          onMapCreated: (controller) {
            _googleMapController = controller;
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(13.794016707620859, 100.32127148805849),
            zoom: 16,
          ),
          markers: _buildMarkers(),
          onTap: (LatLng latLng) {
            // Handle tapping on map
          },
        ),
      ],
    );
  }
 
  Set<Marker> _buildMarkers() {
    Set<Marker> markers = {};
 
    // Create markers from locations data
    for (LocationData location in locations) {
      Marker marker = Marker(
        markerId: MarkerId(location.name),
        position: LatLng(location.latitude, location.longitude),
        infoWindow: InfoWindow(title: location.name), // Set location name as marker title
        onTap: () {
          _showLocationInfo(context, location);
        },
      );
      markers.add(marker);
    }
 
    return markers;
  }
 
  void _showLocationInfo(BuildContext context, LocationData location) {
    LatLng position = LatLng(location.latitude, location.longitude);
 
    _googleMapController.animateCamera(
      CameraUpdate.newLatLngZoom(position, 16),
    );
 
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return _buildLocationDetails(location);
      },
    );
  }
 
  Widget _buildLocationDetails(LocationData location) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            location.name,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (String image in location.images)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/$image',
                        height: 150,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
            height: 3,
            color: Colors.grey,
          ),
          SizedBox(height: 4),
          Text(
            'Facilities',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: location.icons.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      Icon(location.icons[index]),
                      SizedBox(width: 8),
                      Text(location.iconTexts[index]),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}