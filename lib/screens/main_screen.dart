import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_animation/data/movies.dart';
import 'package:movie_app_animation/utils/radius.dart';
import 'package:movie_app_animation/utils/screen_size.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController controller = PageController();
  bool isContainerVisible = true;
  MovieModel? activeMovie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: ScreenSize.height(context),
            width: double.infinity,
            child: Stack(
              children: [
                PageView.builder(
                  itemCount: movieList.length,
                  reverse: true,
                  controller: controller,
                  itemBuilder: (context, index) {
                    return Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(movieList[index].imgPath)),
                        gradient: const LinearGradient(colors: [
                          Colors.white30,
                          Colors.white70,
                        ]),
                      ),
                    );
                  },
                ),
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.35, 0.95],
                      colors: [
                        Colors.white.withOpacity(0.00001),
                        Colors.white,
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: ScreenSize.heightPercent(context, 68),
                    // width: ScreenSize.widthPercent(context, 75),
                    // color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CarouselSlider(
                          items: movieList.map((e) {
                            return SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(
                                        ScreenSize.widthPercent(context, 5)),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: AppRadius.radius20,
                                    ),
                                    width: ScreenSize.widthPercent(context, 75),
                                    height:
                                        ScreenSize.heightPercent(context, 55),
                                    child: ClipRRect(
                                      borderRadius: AppRadius.radius20,
                                      child: AnimatedBuilder(
                                        animation: controller,
                                        builder: (context, child) {
                                          double slidePosition =
                                              controller.page ?? 0.0;
                                          print(slidePosition);

                                          double angle =
                                              (slidePosition - e.id) * 0.4;

                                          Matrix4 transform = Matrix4.identity()
                                            ..setEntry(3, 2, 0.001)
                                            ..rotateX(angle);
                                          return Transform(
                                            transform: transform,
                                            child: Image(
                                              fit: BoxFit.cover,
                                              image: AssetImage(e.imgPath),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),

                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isContainerVisible =
                                            !isContainerVisible;
                                      });
                                    },
                                    child: Text(
                                      '⭐️ 5 - ${e.name}',
                                      style:
                                          GoogleFonts.abhayaLibre(fontSize: 25),
                                    ),
                                  ),
                                  // ElevatedButton(
                                  //     style: ElevatedButton.styleFrom(
                                  //         shape: RoundedRectangleBorder(
                                  //             borderRadius:
                                  //                 BorderRadius.circular(15)),
                                  //         fixedSize: Size(
                                  //             ScreenSize.widthPercent(context, 85),
                                  //             ScreenSize.heightPercent(context, 7))),
                                  //     onPressed: () {},
                                  //     child: const Text('BUY TICKET'))
                                ],
                              ),
                            );
                          }).toList(),
                          options: CarouselOptions(
                            enableInfiniteScroll: false,
                            onPageChanged: (index, reason) {
                              controller.animateToPage(index,
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.easeInOutCirc);
                            },
                            enlargeFactor: 0.6,
                            enlargeCenterPage: true,
                            height: ScreenSize.heightPercent(context, 68),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
