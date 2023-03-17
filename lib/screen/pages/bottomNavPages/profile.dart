import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_clone/models/userInfo_model.dart';
import 'package:pinterest_clone/screen/widgets/bottomNavWidgets/bottomNavItem.dart';
import 'package:pinterest_clone/storage/storage.dart';

import '../../../services/userInfo_service.dart';
import 'home.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<UserInfoModel> info = [];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 24, 23, 23),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 24, 23, 23),
          elevation: 0,
          foregroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                color: Colors.white,
                size: 25,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_horiz,
                color: Colors.white,
                size: 25,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                FutureBuilder(
                    future: UserInfoService.getPhotos(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        EasyLoading.show();
                        return SizedBox();
                      } else if (snapshot.hasData) {
                        snapshot.data?.fold((l) {
                          EasyLoading.showError(l);
                        }, (r) {
                          EasyLoading.dismiss();
                          //UserInfoModel infoModel = r;
                          info.add(r);
                        });
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 65,
                              child: Center(
                                child: Text(
                                  info[0].name[0],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              info[0].name.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 38,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              info[0].username.toString(),
                              style: const TextStyle(
                                color: Color.fromARGB(255, 138, 137, 137),
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${info[0].followersCount} followers . ${info[0].followingCount} following',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                                width: 180,
                                height: 50,
                                child: AppBar(
                                  elevation: 0,
                                  backgroundColor: Colors.transparent,
                                  bottom: const TabBar(
                                      indicatorWeight: 3,
                                      indicatorColor:
                                          Color.fromARGB(255, 70, 69, 69),
                                      indicatorPadding: EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                      ),
                                      tabs: [
                                        Tab(
                                          text: 'Created',
                                        ),
                                        Tab(
                                          text: 'Saved',
                                        ),
                                      ]),
                                )),

                        SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height:( MediaQuery.of(context).size.height*0.332*box!.values.length)/2,
                  child: TabBarView(children: [
                    Container(
                      color: Color.fromARGB(255, 24, 23, 23),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 25,
                          ),
                          const Text(
                            'Inspire with an Idea Pin',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    shape: StadiumBorder(),
                                    backgroundColor:
                                        Color.fromARGB(255, 235, 21, 21)),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2, vertical: 12),
                                  child: Text(
                                    'Create',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Color.fromARGB(255, 24, 23, 23),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.83,
                                  height: 43,
                                  child: TextFormField(
                                    textAlignVertical: TextAlignVertical.bottom,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    cursorColor: Colors.red,
                                    cursorHeight: 25,
                                    decoration: const InputDecoration(
                                      hintText: 'Search your Pins',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: Colors.white70,
                                      ),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 49, 48, 48),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                        borderSide: BorderSide.none,
                                        ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SafeArea(
                            child: Container(
                              child: MasonryGridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                  ),
                                  itemCount: box!.values.length,
                                  //physics: ClampingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return box!.isNotEmpty
                                        ? Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  child: Image(
                                                      image: NetworkImage(box!
                                                          .getAt(index)!
                                                          .urls!
                                                          .small!)),
                                                ),
                                                Container(
                                                  height: 30,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons.favorite,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    211,
                                                                    14,
                                                                    14),
                                                            size: 15,
                                                          ),
                                                          SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.3,
                                                              child: Text(
                                                              // ignore: unnecessary_null_comparison
                                                              box!
                                                                      .getAt(
                                                                          index)!
                                                                      .description ?? 'Likes',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style:
                                                                  const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      IconButton(
                                                          onPressed: () {},
                                                          icon: const Icon(
                                                            Icons.more_horiz,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    218,
                                                                    216,
                                                                    216),
                                                          ))
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        : Container(
                                            child: const Center(
                                              child: Text(
                                                'You haven\'t saved media',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          );
                                  }),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
                )
                          ],
                        );
                      } else {
                        return Text("Error: ${snapshot.error}");
                      }
                    }
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
