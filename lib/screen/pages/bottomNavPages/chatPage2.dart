import 'package:flutter/material.dart';
import 'package:pinterest_clone/screen/widgets/chatWidgets.dart/chatPage2Wid.dart';

import '../others/char2EnterPage.dart';

bool isActive = false;

class Chat2 extends StatefulWidget {
  const Chat2({super.key});

  @override
  State<Chat2> createState() => _Chat2State();
}

class _Chat2State extends State<Chat2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 23, 23),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.18,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: const Center(
                      child: Text(
                        'Share ideas width your friends',
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.bottom,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                          hintText: 'Search by name or email address',
                          hintStyle: TextStyle(
                              color: Color.fromARGB(195, 255, 255, 255)),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color.fromARGB(223, 255, 255, 255),
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 54, 52, 52),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            borderSide: BorderSide.none,
                          )),
                    ),
                  )
                ],
              ),
              
              const SizedBox(
                height: 20,
              ),
              isActive == false
                  ? chatPage2Widget(
                      Color.fromARGB(216, 243, 241, 241),
                      'S',
                      null,
                      'Sync contacts',
                      context,
                     
                      () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor:
                                    Color.fromARGB(255, 43, 42, 42),
                                title: const Text(
                                  'So\'rov',
                                  style: TextStyle(color: Colors.white),
                                ),
                                content: const Text(
                                  'Dasturga kirganda birmartta soraladigan sorov',
                                  style: TextStyle(color: Colors.white),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    child: const Text(
                                      'No',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    child: const Text(
                                      'Yes',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      isActive = true;
                                      setState(() {});
                                    },
                                  ),
                                ],
                              );
                            });
                      },
                    )
                  : const SizedBox(
                      width: 0.000000001,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
