import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_clone/screen/widgets/homeWidgets/homePhoto_item.dart';
import 'package:pinterest_clone/services/carsAlbum_service.dart';
import '../../../models/allAlbum.model.dart';

List<AllPhotoModel> photoList2 = [];
Widget page2() {
  return SafeArea(
    child: Container(
      child: photoList2.isEmpty? 
      FutureBuilder(
        future: CarAlbumService.getCarAlbum(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            EasyLoading.show();
            return SizedBox();
          } else if (snapshot.hasData) {
            snapshot.data?.fold((l) {
              EasyLoading.showError(l);
            }, (r) {
              EasyLoading.dismiss();
              photoList2 = r;
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
                  itemCount: photoList2.length,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return homeItem1(photoList2[index],context);
                  }),
            );
          } else {
            return Text("Error: ${snapshot.error}");
          }
        },
      ):
       Padding(
              padding: EdgeInsets.all(5),
              child: MasonryGridView.builder(
                  shrinkWrap: true,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: photoList2.length,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return homeItem1(photoList2[index],context);
                  }),
            )
    ),
  );
}
