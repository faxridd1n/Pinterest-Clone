import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_clone/models/allAlbum.model.dart';
import 'package:pinterest_clone/screen/pages/others/Page1.dart';
import '../../../services/lifestyle_service.dart';
import '../../../storage/storage.dart';
import '../../widgets/homeWidgets/homePhoto_item.dart';
import 'Page2.dart';

int a = 0;
List<AllPhotoModel> photoList = [];

class HomePhotoEnter extends StatefulWidget {
  HomePhotoEnter(this.model, {super.key});
  AllPhotoModel model;
  @override
  State<HomePhotoEnter> createState() => _HomePhotoEnterState();
}

class _HomePhotoEnterState extends State<HomePhotoEnter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 15, 15, 15),
      body: Stack(children: [
        SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 15,
              ),
              child: Container(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          child: Image(
                            image: NetworkImage(
                              widget.model.urls!.full!,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 13,
                          right: 15,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.more_horiz,
                              size: 35,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 15,
                          right: 15,
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: Color.fromARGB(213, 43, 41, 41),
                            child: Center(
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.qr_code_scanner_rounded,
                                  size: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        color: Color.fromARGB(255, 31, 29, 29),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                widget.model.user?.profileImage != null
                                    ? ClipOval(
                                        child: Image(
                                          image: NetworkImage(
                                            widget.model.user!.profileImage!
                                                .small!,
                                          ),
                                          fit: BoxFit.cover,
                                          height: 48,
                                          width: 48,
                                        ),
                                      )
                                    : const CircleAvatar(
                                        radius: 24,
                                        backgroundColor: Colors.white,
                                      ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      child: Text(
                                        widget.model.user!.name!,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '${widget.model.likes} Likes',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    )
                                  ],
                                ),
                                Expanded(child: Container()),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    shape: StadiumBorder(),
                                    backgroundColor:
                                        Color.fromARGB(255, 63, 61, 61),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 7.0, vertical: 14),
                                    child: Text(
                                      'Follow',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Text(
                                widget.model.description == null
                                    ? ''
                                    : widget.model.description!,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.mode_comment,
                                      color: Colors.white,
                                      size: 30,
                                    )),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        shape: StadiumBorder(),
                                        backgroundColor:
                                            Color.fromARGB(255, 63, 61, 61),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.0, vertical: 18),
                                        child: Text(
                                          'View',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        var item = widget.model;
                                        a++;
                                        box!.add(item);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                              
                                          SnackBar(
                                            backgroundColor: Colors.transparent,
                                            margin: EdgeInsets.only(
                                              bottom: MediaQuery.of(context)
                                                      .size
                                                      .height -
                                                  95,
                                              top: 25,
                                            ),
                                            dismissDirection:
                                                DismissDirection.up,
                                            behavior: SnackBarBehavior.floating,
                                            duration: Duration(seconds: 1),
                                            content: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              height: 80,
                                              child: Container(
                                                padding: EdgeInsets.symmetric(horizontal: 35,vertical: 8),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  color: Color.fromARGB(255, 26, 24, 24),
                                                ),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Image(
                                                      image: NetworkImage(
                                                        widget
                                                            .model.urls!.small!,
                                                      ),
                                                      height: 40,
                                                      width: 40,
                                                    ),
                                                    const Text(
                                                      'Image saved to your profile',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: StadiumBorder(),
                                        backgroundColor:
                                            Color.fromARGB(255, 189, 6, 6),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.0, vertical: 18),
                                        child: Text(
                                          'Save',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.share,
                                      color: Colors.white,
                                      size: 30,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color.fromARGB(255, 31, 29, 29),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'More like this',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          FutureBuilder(
                            future: LifeAlbumService.getLifeAlbum(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                EasyLoading.show();
                                return SizedBox();
                              } else if (snapshot.hasData) {
                                snapshot.data?.fold((l) {
                                  EasyLoading.showError(l);
                                }, (r) {
                                  EasyLoading.dismiss();
                                  photoList = r;
                                });
                                return Padding(
                                  padding: EdgeInsets.all(5),
                                  child: MasonryGridView.builder(
                                      shrinkWrap: true,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      gridDelegate:
                                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                      ),
                                      itemCount: photoList.length,
                                      physics: ClampingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return homeItem1(
                                            photoList[index], context);
                                      }),
                                );
                              } else {
                                return Text("Error: ${snapshot.error}");
                              }
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 65,
          left: 15,
          child: CircleAvatar(
            radius: 21,
            backgroundColor: Color.fromARGB(192, 43, 41, 41),
            child: Center(
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 22,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
