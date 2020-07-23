import 'package:anime_app/api/base/ReturnedData.dart';
import 'package:anime_app/api/model/Episode.dart';

class Episodes {
  String requestHash;
  bool requestCached;
  int requestCacheExpiry;
  int episodesLastPage;
  List<Episode> episode;

  Episodes(
      {this.requestHash,
        this.requestCached,
        this.requestCacheExpiry,
        this.episodesLastPage,
        this.episode});



  Episodes.fromJson(Map<String, dynamic> json) {
    requestHash = json['request_hash'];
    requestCached = json['request_cached'];
    requestCacheExpiry = json['request_cache_expiry'];
    episodesLastPage = json['episodes_last_page'];
    if (json['episodes'] != null) {
      episode = new List<Episode>();
      json['episodes'].forEach((v) {
        episode.add(new Episode.fromJson(v));
      });
    }else {
      episode = new List<Episode>();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_hash'] = this.requestHash;
    data['request_cached'] = this.requestCached;
    data['request_cache_expiry'] = this.requestCacheExpiry;
    data['episodes_last_page'] = this.episodesLastPage;
    if (this.episode != null) {
      data['episodes'] = this.episode.map((v) => v.toJson()).toList();
    }
    return data;
  }
}