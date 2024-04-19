import 'package:flutter/material.dart';

class LiveMapPage extends StatelessWidget {
  const LiveMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchBar(),
          SizedBox(
            height: 95,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 340,
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/library_1.HEIC'),
                      ),
                      title: Text('Place ${index + 1}'),
                    ),
                  ),
                );
              },
              // separatorBuilder: (context, index) {
              //   return SizedBox(width: 10);
              // },
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // สีของเงา
            spreadRadius: 5, // การกระจายของเงา
            blurRadius: 7, // ความเบลอของเงา
            offset: Offset(0, 3), // ตำแหน่งเงา
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(width: 20),
          Icon(Icons.search, color: Color(0xFF1A1A1A)),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
      
    );
  }
}
