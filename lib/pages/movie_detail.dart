import 'package:flutter/material.dart';
import 'package:len_afisha/models/movie.dart';
import 'package:len_afisha/widgets/movie_detail_card.dart';
import 'package:len_afisha/widgets/movie_detail_page_sliver_appbar.dart';

class MovieDetailPage extends StatelessWidget {
  static const routName = 'movie-detail-page';
  const MovieDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie _movie = ModalRoute.of(context).settings.arguments as Movie;

    return Material(
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: MovieDetailPageSliverAppBar(
              expandedHeight: 200,
              movie: _movie,
            ),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: MovieDetailCard(
              movieTitle: _movie.title,
              movieGenre: _movie.genre,
              movieCountry: _movie.country,
              movieYear: _movie.year,
              movieAgeRating: _movie.ageRating.toString(),
              movieDuration: _movie.duration,
              movieKpRatingUrl: _movie.rating,
              movieSynopsis: _movie.synopsis,
              movieImdbRating: _movie.imdbRating,
              movieImdbRatingNumberOfVotes: _movie.imdbRatingNumberOfVotes,
              movieKpRating: _movie.kpRating,
              movieKpRatingNumberOfVotes: _movie.kpRatingNumberOfVotes,
            ),
          ),
        ],
      ),
    );
  }
}
