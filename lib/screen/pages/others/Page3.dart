import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_clone/screen/widgets/homeWidgets/homePhoto_item.dart';
import 'package:pinterest_clone/services/lifestyle_service.dart';
import 'package:rive/rive.dart';
import '../../../models/allAlbum.model.dart';

List<AllPhotoModel> photoList3 = [];
class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
   final _offsetToArmed = 220.0;

  @override
  Widget build(BuildContext context) {
    return  
    Scaffold(
              backgroundColor: Color.fromARGB(255, 25, 25, 26),

    body:CustomRefreshIndicator(
        onRefresh: () {
            return Future.delayed(
              const Duration(
                seconds: 3,
              ),
            );
          },
          offsetToArmed: _offsetToArmed,
          builder: (BuildContext context, Widget child,
              IndicatorController controller) {
            return AnimatedBuilder(
              
                animation: controller,
                child: child,
                builder: (context, child) {
                  return Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: _offsetToArmed * controller.value,
                        child: const RiveAnimation.asset(
                          'assets/1738-3431-raster-graphics-example.riv',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                          0.0,
                          _offsetToArmed * controller.value,
                          
                        ),
                        child:controller.isLoading?Center(child: CircularProgressIndicator()):child,
                      ),
                    ],
                  );
                },
                );
          },
       child: Container(
            color: Color.fromARGB(255, 25, 25, 26),

        child: photoList3.isEmpty
            ? FutureBuilder(
                future: LifeAlbumService.getLifeAlbum(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    EasyLoading.show();
                    return  SizedBox();
                  } else if (snapshot.hasData) {
                    snapshot.data?.fold((l) {
                      EasyLoading.showError(l);
                    }, (r) {
                      EasyLoading.dismiss();
                      photoList3 = r;
                    });
                    return Padding(
                      padding:  EdgeInsets.all(5),
                      child: MasonryGridView.builder(
                          shrinkWrap: true,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          gridDelegate:
                               SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: photoList3.length,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return homeItem1(photoList3[index], context);
                          }),
                    );
                  } else {
                    return Text("Error: ${snapshot.error}");
                  }
                },
              )
            : Padding(
                padding:  EdgeInsets.all(5),
                child: MasonryGridView.builder(
                    shrinkWrap: true,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    gridDelegate:
                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: photoList3.length,
                    physics:  const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return homeItem1(
                        photoList3[index], context,
                        );
                    },
                    ),
              ),
              ),
    
              ),
      );

  }
}

