import 'package:flutter_dotenv/flutter_dotenv.dart';

const baseUrl = "https://api.themoviedb.org/3";
const baseImage = "https://image.tmdb.org/t/p/w500/";

Map<String, String> getCommonHeaders() {
 final token = dotenv.get('TMDB_TOKEN', fallback: '');
 if (token.isEmpty) {
  throw Exception('TMDB_TOKEN is missing. Check your .env file.');
 }

 return {
  "Content-Type": "application/json",
  "Authorization": "Bearer $token"
 };
}
