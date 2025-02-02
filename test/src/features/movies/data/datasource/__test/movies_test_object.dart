import 'package:movies/src/features/movies/data/models/movie/movie.dart';
import 'package:movies/src/features/movies/data/models/movie/movie_response.dart';

const movieTestObject = Movie(
  id: 1222248,
  title: "Number 24",
  originalTitle: "Nr. 24",
  posterPath: "/rzsmKSFEsEWBLbJ968abffnfYZ7.jpg",
  backdropPath: "/3WnoZw50qIfXsFnKr0LddEh5Jnf.jpg",
  releaseDate: "2024-10-30",
  popularity: 909.027,
  voteAverage: 7.3,
  voteCount: 176,
);

const movieResponseTestObject = MovieResponse(
  page: 2,
  results: [movieTestObject],
  totalPages: 48478,
  totalResults: 969557,
);