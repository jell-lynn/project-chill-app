import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';


class HomeSwipe extends StatefulWidget {
  const HomeSwipe({Key? key}) : super(key: key);

  @override
  State<HomeSwipe> createState() => _HomeSwipeState();
}

class _HomeSwipeState extends State<HomeSwipe> {
  final _controller = PageController(
    initialPage: 0,
  );

  int numberPhotos = 5;
  int currentPhotoIndex = 0;
  List<String> photoList = [
    'assets/library_1.HEIC',
    'assets/mlc_4.HEIC',
    'assets/ict_3.HEIC',
    'assets/cafe-en_1.HEIC',
    'assets/bellinee_3.HEIC',
  ];

  late MatchEngine _matchEngine;

  List<SwipeItem> items = [
    SwipeItem(
        content: 'Library and Knowledge Center',
        likeAction: () {
          log('Like');
        },
        nopeAction: () {
          log('Nope');
        },
    ),
    SwipeItem(
        content: 'Mahidol Learning Center (MLC)',
        likeAction: () {
          log('Like');
        },
        nopeAction: () {
          log('Nope');
        },
    ),
    SwipeItem(
        content: 'Innovative Space MUICT',
        likeAction: () {
          log('Like');
        },
        nopeAction: () {
          log('Nope');
        },
    ),
    SwipeItem(
        content: 'Cafe Amazon EN',
        likeAction: () {
          log('Like');
        },
        nopeAction: () {
          log('Nope');
        },
    ),
    SwipeItem(
        content: 'Bellinee’s at MLC',
        likeAction: () {
          log('Like');
        },
        nopeAction: () {
          log('Nope');
        },
    ),
  ];

  @override
  void initState() {
    _matchEngine = MatchEngine(swipeItems: items);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SwipeCards(
        matchEngine: _matchEngine,
        upSwipeAllowed: true,
        onStackFinished: () {},
        itemBuilder: (context, index) {
          if (index >= items.length) {
            return Container(); // หยุดการสร้าง items เมื่อ index เกินขนาดของ items list
          }
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
                          image: AssetImage('assets/library_1.HEIC'),
                        ),
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
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  items[index].content,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25
                                  ),
                                ),
                              ],
                            ),
                            // IconButton(
                            //   onPressed: () {

                            //   },
                            //   icon: Icon(
                            //     arrow_drop_down_circle_rounded,
                            //     color: Colors.white,
                            //   )
                            // )
                          ),
                          const SizedBox(height: 10,),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   children: [
                          //     Material(
                          //       color: Colors.transparent,
                          //       child: InkWell(
                          //         onTap: () {

                          //         },
                          //         splashColor: Color(0xFF666666),
                          //         borderRadius: ,
                          //       ),
                          //     ),
                          //   ],
                          // ),
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
      // bottomNavigationBar: BottomNavigation(),
    );
  }
}
