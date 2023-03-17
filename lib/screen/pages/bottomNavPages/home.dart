import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pinterest_clone/screen/pages/others/Page1.dart';
import 'package:pinterest_clone/screen/pages/others/Page2.dart';
import 'package:pinterest_clone/services/allAlbum_service.dart';
import 'package:rive/rive.dart';

import '../../../models/allAlbum.model.dart';
import '../others/Page3.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _loadMoreData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMoreData();
      }
    });
  }

  List<AllPhotoModel> photoList = [];
  int page = 0;
  PageController _controller1 = PageController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 25, 25, 26),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 25, 25, 26),
          title: TabBar(
            indicatorColor: Color.fromARGB(255, 190, 189, 189),
            isScrollable: true,
            onTap: (value) {
              page = value;
              _controller1.jumpToPage(page);
              setState(() {});
            },
            tabs: const [
              Tab(
                text: 'All',
              ),
              Tab(
                text: 'Yellow Rush',
              ),
              Tab(
                text: 'Others',
              ),
            ],
          ),
        ),
        body: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _controller1,
              children: [
                Page3(),
                page2(),
                page1(),
              ]),
       
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadMoreData() async {
    var res = await AllAlbumService.getCarAlbum(_currentPage);
    res.fold((l) {
      EasyLoading.showError(l);
    }, (r) {
      setState(() {
        photoList.addAll(r);
        _currentPage++;
      });
      return photoList;
    });
  }
}

List photos = [
  'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://planetofhotels.com/guide/sites/default/files/styles/paragraph__hero_banner__hb_image__1880bp/public/hero_banner/Maidens_Tower.jpg',
  'https://media.istockphoto.com/id/684827018/id/foto/menerangi-hagia-sophia-ayasofya-saat-senja-di-istanbul-turki.jpg?s=170667a&w=0&k=20&c=QCDJbas2FHzyh8Cp_FBnjk-IOOdxrH0kNOLPErCUP2M=',
  'https://i.redd.it/03nlpez866o51.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/4/44/Sultan_Ahmed_I_Mosque_from_Sultanahmet_Square_2007.jpg',
  'https://images.pexels.com/photos/11056135/pexels-photo-11056135.jpeg?cs=srgb&dl=pexels-mary-11056135.jpg&fm=jpg',
  'https://aviationweek.com/sites/default/files/styles/crop_freeform/public/2021-12/PHOTO2021-BEST-Aldo_Wicki.jpg?itok=sLkNUOuT',
  'https://st2.depositphotos.com/2001755/5408/i/600/depositphotos_54081723-stock-photo-beautiful-nature-landscape.jpg',
  'https://s3.reutersmedia.net/resources/r/?m=02&d=20211004&t=2&i=1576794788&w=780&fh=&fw=&ll=&pl=&sq=&r=2021-10-04T143213Z_42023_MRPRC2V1Q9II8U3_RTRMADP_0_SPAIN-VOLCANO',
  'https://static.wixstatic.com/media/bb1bd6_f221ad0f4d6f4103bf1d37b68b04492e~mv2.png/v1/fill/w_640,h_366,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/bb1bd6_f221ad0f4d6f4103bf1d37b68b04492e~mv2.png',
  'https://www.goway.com/media/cache/4e/0a/4e0a8fd5d3dd8768bbe28bca6dab10f1.jpg',
  'https://www.propertyturkey.com/uploads/pages/larg/cappadocia_10.jpg',
  'https://www.travelanddestinations.com/wp-content/uploads/2019/08/Turkey-beautiful-places-to-see-and-visit.jpg',
];
