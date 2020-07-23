class Episode {
  int episodeId;
  String title;
  String titleJapanese;
  String titleRomanji;
  String aired;
  bool filler;
  bool recap;
  String videoUrl;
  String forumUrl;

  Episode
      ({this.episodeId,
        this.title,
        this.titleJapanese,
        this.titleRomanji,
        this.aired,
        this.filler,
        this.recap,
        this.videoUrl,
        this.forumUrl});

  Episode.fromJson(Map<String, dynamic> json) {
    episodeId = json['episode_id'];
    title = json['title'];
    titleJapanese = json['title_japanese'];
    titleRomanji = json['title_romanji'];
    aired = json['aired'];
    filler = json['filler'];
    recap = json['recap'];
    videoUrl = json['video_url'];
    forumUrl = json['forum_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['episode_id'] = this.episodeId;
    data['title'] = this.title;
    data['title_japanese'] = this.titleJapanese;
    data['title_romanji'] = this.titleRomanji;
    data['aired'] = this.aired;
    data['filler'] = this.filler;
    data['recap'] = this.recap;
    data['video_url'] = this.videoUrl;
    data['forum_url'] = this.forumUrl;
    return data;
  }
}