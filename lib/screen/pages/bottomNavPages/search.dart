import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_clone/storage/storage.dart';

import '../../../models/SearchModel.dart';
import '../../../services/photo_service.dart';
import '../../widgets/homeWidgets/homePhoto_item.dart';

List<Result> searchList = [];

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController search = TextEditingController();

  int _currentPage = 1;
  bool showHistory = false;

  final ScrollController _scrollController = ScrollController();
  void initState() {
    searchList.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 23, 23),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 24, 23, 23),
          title: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 50,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(
                onTap: () {
                  showHistory = true;
                  setState(() {});
                },
                onChanged: (value) async {
                  if (value.length < 1) {
                    searchList.clear();
                    setState(() {
                      
                    });
                  }
                  if (value.length > 2) {
                    searchList.clear();
                    var res = await PhotoService.searchPhotos(
                        search: value, page: _currentPage);
                    res.fold((l) {
                      EasyLoading.showError(l);
                    }, (r) {
                      searchedPhotos!.add(value);
                      for (int i = 0;
                          i < searchedPhotos!.values.length - 1;
                          i++) {
                        searchedPhotos!.deleteAt(i);
                      }
                      showHistory = false;
                      searchList = r;
                      setState(() {});
                    });
                  }
                },
                controller: search,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlignVertical: TextAlignVertical.bottom,
                cursorColor: Colors.red,
                cursorHeight: 25,
                decoration: const InputDecoration(
                    hintText: 'Search for ideas',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white70,
                    ),
                    suffixIcon: Icon(
                      Icons.camera_alt,
                      color: Colors.white70,
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 49, 48, 48),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      borderSide: BorderSide.none,
                    )),
              ),
            ),
          )),
      body: showHistory == true
          ? Container(
              child: ListView.builder(
                itemCount: searchedPhotos!.values.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text(
                                searchedPhotos!.getAt(index)!,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                searchedPhotos!.deleteAt(index);

                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.clear,
                                size: 22,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: searchList.isEmpty
                    ? const Center(
                        child: Text('No result'),
                      )
                    : MasonryGridView.count(
                        controller: _scrollController,
                        crossAxisCount: 2,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        itemCount: searchList.length,
                        itemBuilder: (context, index) {
                          return searchItem(
                            searchList[index],
                            context,
                          );
                        },
                      ),
              ),
            ),
    );
  }

  void dispose() {
    super.dispose();
    _scrollController.dispose();
    search.dispose();
  }

  Future<void> _loadMoreData() async {
    var res = await PhotoService.searchPhotos(page: _currentPage);
    res.fold((l) {
      EasyLoading.showError(l);
    }, (r) {
      setState(() {
        searchList.addAll(r);
        _currentPage++;
      });
      return searchList;
    });
  }
}
