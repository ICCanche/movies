import 'package:flutter_dotenv/flutter_dotenv.dart';

const baseUrl = "https://api.themoviedb.org/3";
const baseImage = "https://image.tmdb.org/t/p/w500/";
final commonHeaders = {
 "Content-Type": "application/json",
 "Authorization": "Bearer ${dotenv.get('TMDB_TOKEN')}"
};
