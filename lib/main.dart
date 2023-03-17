import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pinterest_clone/models/allAlbum.model.dart';
import 'package:pinterest_clone/screen/pages/bottomNavPages/add.dart';
import 'package:pinterest_clone/screen/pages/bottomNavPages/chat.dart';
import 'package:pinterest_clone/screen/pages/bottomNavPages/home.dart';
import 'package:pinterest_clone/screen/pages/bottomNavPages/profile.dart';
import 'package:pinterest_clone/screen/pages/bottomNavPages/search.dart';
import 'package:pinterest_clone/screen/widgets/bottomNavWidgets/bottomNavItem.dart';
import 'package:pinterest_clone/storage/storage.dart';

import 'core/constants.dart';

//nb=
bool sel1 = true;
int b = 0;
int page = 0;
void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(AllPhotoModelAdapter());
  Hive.registerAdapter(AllPhotoModelLinksAdapter());
  Hive.registerAdapter(TopicSubmissionsAdapter());
  Hive.registerAdapter(ArtsCultureAdapter());
  Hive.registerAdapter(FilmAdapter());
  Hive.registerAdapter(UrlsAdapter());
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(UserLinksAdapter());
  Hive.registerAdapter(ProfileImageAdapter());
  Hive.registerAdapter(SocialAdapter());

  box = await Hive.openBox('box');
  searchedPhotos = await Hive.openBox('searchedPhotos');
  AppInit.configLoading();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
        home: Page());
  }
}

class Page extends StatefulWidget {
  const Page({super.key});

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        color: Colors.transparent,
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          height: 70,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 31, 40, 48),
              borderRadius: BorderRadius.circular(20)),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: bottomNavItem(
                    index,
                    list[index],
                    () {
                      index != 2 ? _controller.jumpToPage(index) : null;
                      setState(
                        () {},
                      );
                    },
                    context,
                  ),
                );
              },
            ),
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          b = value;
          page = b;
          // _controller.jumpToPage(page);
          setState(() {});
        },
        controller: _controller,
        children: const [
          HomePage(),
          SearchPage(),
          AddPage(),
          ChatPage(),
          ProfilePage(),
        ],
      ),
    );
  }
}
