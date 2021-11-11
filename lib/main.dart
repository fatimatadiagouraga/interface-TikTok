// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:math' as math;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TikTok',
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Homepage(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'search',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/add.png',
              height: 25,
            ),
            label: 'search',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.comment_outlined),
            label: 'comment',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'profil',
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF141518),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }
}

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);
  final List<Map> tiktokItems = [
    {
      "video": "assets/videos/A2.mp4",
    },
    {
      "video": "assets/videos/tj2.mp4",
    },
    {
      "video": "assets/videos/tj3.mp4",
    },
    {
      "video": "assets/videos/A4.mp4",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: double.infinity,
        viewportFraction: 1.0,
        scrollDirection: Axis.vertical,
      ),
      items: tiktokItems.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              color: Color(0xFF141518),
              child: Stack(
                children: [
                  VideoWidget(videoUrl: item['video']),
                  const PostContent()
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class VideoWidget extends StatefulWidget {
  const VideoWidget({Key? key, required this.videoUrl}) : super(key: key);
  final String videoUrl;

  @override
  // ignore: unnecessary_this, no_logic_in_create_state
  _VideoWidgetState createState() => _VideoWidgetState(this.videoUrl);
}

class _VideoWidgetState extends State<VideoWidget> {
  // ignore: unused_field
  late VideoPlayerController _controller;
  final String videoUrl;
  _VideoWidgetState(this.videoUrl);

  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(videoUrl)
      ..initialize().then((_) {
        _controller.play();
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayer(_controller);
  }
}

class PostContent extends StatelessWidget {
  const PostContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var musique_note;
    return Column(
      children: [
        Container(
          height: 100,
          padding: EdgeInsets.only(top: 40),
          //color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                'Following',
                style: TextStyle(
                  color: Colors.white54,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 20),
              Text(
                'For you',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            //color: Colors.red,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    // color: Colors.red.withOpacity(0.5),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          '@tom_jerry',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'si vous aimez tom_jerry ,venez rire avec moi #dessinAnimeMali #Disney',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Icon(
                              Icons.music_note,
                              color: Colors.white,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Original Sound - extremeguittare',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 80,
                  //color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 80,
                        child: Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    AssetImage('assets/images/profil.jpg'),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ],
                        ),
                        //color: Colors.white,
                      ),
                      // SizedBox(
                      //   width: 15,
                      // ),
                      Container(
                        height: 80,
                        margin: EdgeInsets.only(top: 10),
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.white.withOpacity(0.85),
                              size: 45,
                            ),
                            Text(
                              '134.9K',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        //color: Colors.yellow,
                      ),
                      SizedBox(
                        height: 80,
                        //color: Colors.grey,
                        child: Column(
                          children: [
                            Icon(
                              Icons.comment,
                              color: Colors.white.withOpacity(0.85),
                              size: 45,
                            ),
                            Text(
                              '133',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        //color: Colors.red,
                        child: Column(
                          children: [
                            Icon(
                              MdiIcons.share,
                              color: Colors.white.withOpacity(0.85),
                              size: 45,
                            ),
                            Text(
                              '111',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      AnimatedLogo(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AnimatedLogo extends StatefulWidget {
  AnimatedLogo({Key? key}) : super(key: key);

  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 4000),
      vsync: this,
    );
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * math.pi,
          child: child,
        );
      },
      child: Container(
        height: 45,
        width: 45,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            image: AssetImage("assets/images/disque.png"),
          ),
        ),
        child: Image.asset('assets/images/profil.jpg'),
      ),
    );
  }
}
