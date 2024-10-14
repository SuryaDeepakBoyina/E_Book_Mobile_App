import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'ReadingPage.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:ebook/providers/book_providers.dart';

class ListeningPage extends StatefulWidget {
  final String imageAddress;
  final String bookname;
  final String authorname;
  final String bookId;
  const ListeningPage({Key? key, required this.authorname,required this.bookname,required this.imageAddress,required this.bookId}) : super(key: key);
  @override
  _ListeningPageState createState() => _ListeningPageState();
}

class _ListeningPageState extends State<ListeningPage> {
  late bool played;
  late IconData play;

  // String audioUrl = '';

  void playIcon() {
    setState(() {
      played ? play = Icons.pause : play = Icons.play_arrow;
    });
  }
 @override
  void initState() {
    super.initState();
    play = Icons.pause;
    played = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BookProvider>(context, listen: false).fetchAudioUrl(widget.bookId);
    });
  }
 
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      //backgroundColor: Colors.white,
      body: SafeArea(
      child: Consumer<BookProvider>(
        builder: (context, bookProvider, child) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromRGBO(249, 191, 161, 1), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.center,
              ),
            ),

        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
              height: size.height * 0.085,
              width: size.width,
              //color: Colors.red,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: EdgeInsets.all(constraints.maxHeight * 0.18),
                          //color: Colors.black,
                          height: constraints.maxHeight * 0.8,
                          width: constraints.maxWidth * 0.15,
                          child: const FittedBox(
                              child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          )),
                        ),
                      ),
                      SizedBox(
                        //color: Colors.red,
                        height: constraints.maxHeight * 0.85,
                        width: constraints.maxWidth * 0.51,
                        child: Column(
                          children: [
                            SizedBox(
                              // padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth*),
                              //color: Colors.purple,
                              height: constraints.maxHeight * 0.85 * 0.7,
                              width: constraints.maxWidth * 0.35,
                              child: FittedBox(
                                  child: Text(
                                widget.bookname,
                                style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              )),
                            ),
                            SizedBox(
                              // padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth*),
                              //color: Colors.yellow,
                              height: constraints.maxHeight * 0.85 * 0.3,
                              width: constraints.maxWidth * 0.35,
                              child: FittedBox(
                                  child: Text(
                                "Chapter 2",
                                style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              )),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(constraints.maxHeight * 0.18),
                        //color: Colors.black,
                        height: constraints.maxHeight * 0.8,
                        width: constraints.maxWidth * 0.15,
                        child: const FittedBox(
                            child: Icon(Icons.share, color: Colors.white)),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Hero(
              
              tag: const Text("Haha"),
              child: Container(
                height: size.height * 0.5,
                width: size.width * 0.68,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(size.width * 0.05),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(widget.imageAddress),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: const Color.fromRGBO(203, 201, 208, 1),
                          blurRadius: 10,
                          spreadRadius: 0.6,
                          offset: Offset(size.width * 0.55 * 0.051,
                              size.height * 0.4 * 0.031))
                    ]),
              ),
            ),
            SizedBox(
              height: size.height * 0.045,
            ),
            Container(
              width: size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.height * 0.005),
                color: const Color.fromRGBO(235, 235, 237, 1),
              ),
              height: size.height * 0.01,
              child: Stack(
                children: [
                  Container(
                    width: size.width * 0.9 * (173 / 230),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size.height * 0.005),
                      color: const Color.fromRGBO(69, 69, 88, 1),
                    ),
                    height: size.height * 0.01,
                  )
                ],
              ),
            ),
            SizedBox(height: size.height * 0.005),
            SizedBox(
              height: size.height * 0.015,
              width: size.width * 0.9,
              //color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: size.height * 0.015,
                      width: size.width * 0.1,
                      child: FittedBox(
                          child: Text(
                        "17:13",
                        style: GoogleFonts.lato(),
                      ))),
                  SizedBox(
                      height: size.height * 0.015,
                      width: size.width * 0.1,
                      child: FittedBox(
                          child: Text(
                        "24:56",
                        style: GoogleFonts.lato(),
                      )))
                ],
              ),
            ),
            Container(
              //color: Colors.amber,
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              height: size.height * 0.12,
              width: size.width * 0.9,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Material(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(
                              constraints.maxHeight * 0.1),
                          child: SizedBox(
                            //color: Colors.red,
                            height: constraints.maxHeight * 0.6,
                            width: constraints.maxWidth * 0.2,
                            child: const FittedBox(
                                child: Icon(Icons.fast_rewind,
                                    color: Color.fromRGBO(69, 69, 88, 1))),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {
                            played = !played;

                            print("${played}hero");
                            playIcon();
                          },
                          borderRadius: BorderRadius.circular(
                              constraints.maxHeight * 0.1),
                          child: SizedBox(
                            //color: Colors.red,
                            height: constraints.maxHeight * 0.8,
                            width: constraints.maxWidth * 0.25,
                            child: FittedBox(
                                child: Icon(play,
                                    color: const Color.fromRGBO(69, 69, 88, 1))),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(
                              constraints.maxHeight * 0.1),
                          child: SizedBox(
                            //color: Colors.red,
                            height: constraints.maxHeight * 0.6,
                            width: constraints.maxWidth * 0.2,
                            child: const FittedBox(
                                child: Icon(Icons.fast_forward,
                                    color: Color.fromRGBO(69, 69, 88, 1))),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SizedBox(
              //color: Colors.amber,
              height: size.height * 0.1,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Material(
                        borderRadius:
                            BorderRadius.circular(constraints.maxHeight * 0.45),
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(
                              constraints.maxHeight * 0.45 / 2),
                          //splashColor: Colors.grey,
                          child: Container(
                            height: constraints.maxHeight * 0.45,
                            width: constraints.maxWidth * 0.9 / 5,
                            //color: Colors.white,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    constraints.maxHeight * 0.45 / 2)),
                            child: const FittedBox(
                                child: Icon(
                              Icons.book,
                              color: Color.fromRGBO(191, 191, 191, 1),
                            )),
                          ),
                        ),
                      ),
                      Material(
                        borderRadius:
                            BorderRadius.circular(constraints.maxHeight * 0.45),
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(
                              constraints.maxHeight * 0.45 / 2),
                          //splashColor: Colors.grey,
                          child: Container(
                            height: constraints.maxHeight * 0.45,
                            width: constraints.maxWidth * 0.9 / 5,
                            //color: Colors.white,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    constraints.maxHeight * 0.45 / 2)),
                            child: const FittedBox(
                                child: Icon(
                              Icons.text_format,
                              color: Color.fromRGBO(191, 191, 191, 1),
                            )),
                          ),
                        ),
                      ),
                      Material(
                        borderRadius:
                            BorderRadius.circular(constraints.maxHeight * 0.45),
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(
                              constraints.maxHeight * 0.45 / 2),
                          //splashColor: Colors.grey,
                          child: Container(
                            height: constraints.maxHeight * 0.45,
                            width: constraints.maxWidth * 0.9 / 5,
                            //color: Colors.white,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    constraints.maxHeight * 0.45 / 2)),
                            child: const FittedBox(
                                child: Icon(
                              Icons.list,
                              color: Color.fromRGBO(191, 191, 191, 1),
                            )),
                          ),
                        ),
                      ),
                      Material(
                        borderRadius:
                            BorderRadius.circular(constraints.maxHeight * 0.45),
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(
                              constraints.maxHeight * 0.45 / 2),
                          //splashColor: Colors.grey,
                          child: Container(
                            height: constraints.maxHeight * 0.45,
                            width: constraints.maxWidth * 0.9 / 5,
                            //color: Colors.white,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    constraints.maxHeight * 0.45 / 2)),
                            child: const FittedBox(
                                child: Icon(
                              Icons.brightness_3,
                              color: Color.fromRGBO(191, 191, 191, 1),
                            )),
                          ),
                        ),
                      ),
                      Material(
                        borderRadius:
                            BorderRadius.circular(constraints.maxHeight * 0.45),
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(
                              constraints.maxHeight * 0.45 / 2),
                          //splashColor: Colors.grey,
                          child: Container(
                            height: constraints.maxHeight * 0.45,
                            width: constraints.maxWidth * 0.9 / 5,
                            //color: Colors.white,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    constraints.maxHeight * 0.45 / 2)),
                            child: const FittedBox(
                                child: Icon(
                              Icons.headset,
                              color: Color.fromRGBO(69, 69, 88, 1),
                            )),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      );
        }
      ),
    )
    );
  }
}
