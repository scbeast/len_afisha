import 'package:flutter/material.dart';
import 'package:len_afisha/models/movie.dart';
import 'package:len_afisha/pages/movie_poster.dart';

class MovieDetailPageSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final Movie movie;

  MovieDetailPageSliverAppBar(
      {@required this.expandedHeight, @required this.movie});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Image.network(
          movie.posterUrl,
          fit: BoxFit.cover,
          color: Colors.black12,
          colorBlendMode: BlendMode.darken,
        ),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: Text(
              movie.title.toLowerCase(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 1.5,
          left: 8,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Card(
              elevation: 10,
              child: SizedBox(
                height: expandedHeight,
                // width: MediaQuery.of(context).size.width / 2,
                child: InkWell(
                  child: Hero(
                    tag: 'poster',
                    child: Image.network(movie.posterUrl),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      MoviePosterPage.routName,
                      arguments: movie.posterUrl,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 4.0,
          left: 3.0,
          child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        )
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}