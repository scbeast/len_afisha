import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:len_afisha/models/events.dart';

class CarouselSliderMoviePosters extends StatelessWidget {
  const CarouselSliderMoviePosters({Key key, this.eventsData})
      : super(key: key);
  final EventsData eventsData;
  @override
  Widget build(BuildContext context) {
    final List<String> _imgList =
        eventsData.movies.map((f) => f.posterUrl).toList();
    final CarouselSlider _carouselSliderMoviePoster = CarouselSlider(
      viewportFraction: 210 / MediaQuery.of(context).size.height * 1.9,
      height: MediaQuery.of(context).size.height / 3.0,
      // aspectRatio: 16/9,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 3),
      enlargeCenterPage: true,
      pauseAutoPlayOnTouch: const Duration(seconds: 1),
      items: _imgList.map(
        (url) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/wait-poster.gif',
                image: url,
                fit: BoxFit.contain,
              ),
            ),
          );
        },
      ).toList(),
    );
    return _carouselSliderMoviePoster;
  }
}
