import 'package:flutter/material.dart';
import 'package:len_afisha/models/movie.dart';
import 'package:len_afisha/widgets/movie_detail_card.dart';
import 'package:len_afisha/widgets/movie_detail_page_sliver_appbar.dart';

class MovieDetailPage extends StatelessWidget {
  static const routName = 'movie-detail-page';
  const MovieDetailPage({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context).settings.arguments;
    return SafeArea(
      child: Material(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: MovieDetailPageSliverAppBar(
                  expandedHeight: 200, movie: movie),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: MovieDetailCard(
                moviePosterUrl: movie.posterUrl,
                movieTitle: movie.title,
                movieGenre: movie.genre,
                movieCountry: movie.country,
                movieYear: movie.year,
                movieAgeRating: movie.ageRating.toString(),
                movieDuration: movie.duration,
                movieKpRatingUrl: movie.rating,
                movieSynopsis: movie.synopsis,
                movieImdbRating: movie.imdbRating,
                movieImdbRatingNumberOfVotes: movie.imdbRatingNumberOfVotes,
                movieKpRating: movie.kpRating,
                movieKpRatingNumberOfVotes: movie.kpRatingNumberOfVotes,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
