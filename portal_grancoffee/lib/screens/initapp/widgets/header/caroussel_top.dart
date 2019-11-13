import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portal_grancoffee/bloc/initapp/initial_bloc.dart';
import 'package:portal_grancoffee/models/initapp/banner_entity.dart';

class CarrousselTop extends StatefulWidget {
  @override
  _CarrousselTopState createState() => _CarrousselTopState();
}

class _CarrousselTopState extends State<CarrousselTop> {
  CarouselSlider carouselSlider;
  int _current = 0;



  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
  goToPrevious() {
    carouselSlider.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }
  goToNext() {
    carouselSlider.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width >= 1440
          ? 1440
          : MediaQuery
          .of(context)
          .size
          .width,
      child: SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .width >= 1440
              ? 300.0 : MediaQuery
              .of(context)
              .size
              .width / 4.8 < 150 ? 130
              : MediaQuery
              .of(context)
              .size
              .width / 4.8,
          child: StreamBuilder<List<BannerEntity>>(
              stream: blocInitial.allBanner,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Stack(
                    children: <Widget>[
                      carouselSlider = CarouselSlider(
                        height: 300.0,
                        initialPage: 0,
                        enlargeCenterPage: true,
                        autoPlay: false,
                        reverse: false,
                        viewportFraction: 1,
                        enableInfiniteScroll: true,
                        autoPlayInterval: Duration(seconds: 2),
                        autoPlayAnimationDuration: Duration(milliseconds: 2000),
//                pauseAutoPlayOnTouch: Duration(seconds: 10),
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index) {
                          setState(() {
                            _current = index;
                          });
                        },
                        //items: imgLists.map((imgUrl) {
                        items: snapshot.data.map((imgUrl) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                margin: EdgeInsets.symmetric(horizontal: 2.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                ),
                                child: Image.network(
                                  imgUrl.image,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: map<Widget>(snapshot.data, (index, url) {
                            return Container(
                              width: 10.0,
                              height: 10.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _current == index ? Colors.white : Colors
                                    .white30,
                              ),
                            );
                          }),),), Container(
                        height: 300,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 200,
                              width: 50,
                              child: FlatButton(
                                onPressed: goToPrevious,
                                child: Icon(
                                  Icons.arrow_back_ios, color: Colors.white,),
                              ),
                            ),
                            Container(
                              height: 200,
                              width: 50,
                              child: FlatButton(
                                onPressed: goToNext,
                                child: Icon(Icons.arrow_forward_ios,
                                  color: Colors.white,),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return Center(child: CircularProgressIndicator());
              }
          )
      ),
    );
  }
}

