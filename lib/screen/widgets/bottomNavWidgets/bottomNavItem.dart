import 'package:flutter/material.dart';
import 'package:pinterest_clone/screen/pages/bottomNavPages/add.dart';
import 'package:pinterest_clone/screen/pages/bottomNavPages/chat.dart';
import 'package:pinterest_clone/screen/pages/bottomNavPages/home.dart';
import 'package:pinterest_clone/screen/pages/bottomNavPages/profile.dart';
import 'package:pinterest_clone/screen/pages/bottomNavPages/search.dart';
import 'package:rive/rive.dart';

import '../../../main.dart';

Widget bottomNavItem(
    int index, String bottomIcon, void Function() setUI, BuildContext context) {
  return InkWell(
    onTap: () {
      index != 2 ? b = index : b;
      index == 2
          ? showModalBottomSheet(
              backgroundColor: Color.fromARGB(0, 110, 96, 96),
              context: context,
              builder: (BuildContext context) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 51, 49, 49),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),
                  ),
                  height: 210,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                'Start creating now',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color.fromARGB(255, 77, 74, 74),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.all_inbox_rounded,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('Idea Pin',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12,),),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color.fromARGB(255, 77, 74, 74),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.pin_drop,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                  ),
                                ),
                                  const SizedBox(
                                  height: 10,
                                ),
                                Text('Pin',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12,),),
                            
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color.fromARGB(255, 77, 74, 74),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.pages_rounded,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                  ),
                                ),
                                  const SizedBox(
                                  height: 10,
                                ),
                                Text('Board',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12,),),
                            
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            )
          : null;
      setUI();
    },
    child: SizedBox(
      height: 50,
      width: 40,
      child: Stack(
        children: [
          Positioned(
            top: 5,
            left: 5,
            child: GestureDetector(
              child: AnimatedContainer(
                height: b == index ? 4 : 0,
                width: b == index ? 30 : 0,
                alignment: Alignment.center,
                duration: Duration(seconds: 1),
                curve: Curves.easeInOutExpo,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 227, 238, 247),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          RiveAnimation.asset(
            'assets/1298-2487-animated-icon-set-1-color.riv',
            artboard: bottomIcon,
            onInit: (artboard) {},
          ),
        ],
      ),
    ),
  );
}

List list = [
  'HOME',
  'SEARCH',
  'SETTINGS',
  'CHAT',
  'USER',
];
List<StatefulWidget> pages = [
  const HomePage(),
  const SearchPage(),
  const AddPage(),
  const ChatPage(),
  ProfilePage(),
];
