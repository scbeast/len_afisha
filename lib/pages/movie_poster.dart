import 'package:flutter/material.dart';

class MoviePosterPage extends StatelessWidget {
  const MoviePosterPage({Key key}) : super(key: key);

  static const routName = 'movie-poster-page';

  @override
  Widget build(BuildContext context) {
    final String moviePosterUrl = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          Image.network(
            moviePosterUrl,
            fit: BoxFit.cover,
            color: Colors.white70,
            colorBlendMode: BlendMode.lighten,
          ),
          Center(
            child: Card(
              elevation: 10.0,
              child: GestureDetector(
                child: Hero(
                  tag: 'poster',
                  child: Image.network(moviePosterUrl),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
