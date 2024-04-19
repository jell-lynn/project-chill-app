import 'package:flutter/material.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  String? selectedItem = 'Few';
  List<String> items = ['Few', 'Normal', 'Many'];
  List<bool> toggleValues = [false, false, false, false, false, false];

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
              // SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Status",
                  style: TextStyle(
                    color: Color(0xFF3F3F3F),
                    fontWeight: FontWeight.bold
                  ),),
                ],
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/library_1.HEIC'),
              ),
              title: Text('Location Name $index'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Switch(
                        value: toggleValues[index],
                        onChanged: (newValue) {
                          setState(() {
                            toggleValues[index] = newValue;
                          });
                        },
                        activeColor: Colors.green, // Set active color
                        inactiveTrackColor:
                            Colors.grey, // Set inactive track color
                      ),
                      SizedBox(width: 40),
                      DropdownButton<String>(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        value: selectedItem,
                        items: items.map((item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedItem = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
