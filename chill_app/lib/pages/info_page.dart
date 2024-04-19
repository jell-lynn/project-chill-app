import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            ],
          ),
      ),
      // body: ,
    );
  }
}