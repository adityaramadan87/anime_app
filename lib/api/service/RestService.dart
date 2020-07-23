import 'package:anime_app/api/model/Episodes.dart';
import 'package:anime_app/api/model/TopAnime.dart';
import 'package:anime_app/constant/Constant.dart';
import 'package:http/http.dart' as Http;
import 'dart:convert';

class RestService {

  Future<Episodes> getEpisodes(int mal_id) async {
    final response = await Http.get(Constant.BASE_URL + Constant.ANIME + "/$mal_id" + Constant.EPISODE);
    final responseJson = json.decode(response.body);
    return Episodes.fromJson(responseJson);
  }

  Future<TopAnime> getTopAnime(int page, String type) async {
    final response = await Http.get(Constant.BASE_URL + Constant.TOP + Constant.ANIME + "/$page" + type);
    final responseJson = json.decode(response.body);
    return TopAnime.fromJson(responseJson);
  }

}