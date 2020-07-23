class Top {
  int malId;
  int rank;
  String title;
  String url;
  String imageUrl;
  String type;
  int episodes;
  String startDate;
  String endDate;
  int members;
  double score;

  Top(
      {this.malId,
        this.rank,
        this.title,
        this.url,
        this.imageUrl,
        this.type,
        this.episodes,
        this.startDate,
        this.endDate,
        this.members,
        this.score});

  Top.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    rank = json['rank'];
    title = json['title'];
    url = json['url'];
    imageUrl = json['image_url'];
    type = json['type'];
    episodes = json['episodes'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    members = json['members'];
    score = json['score'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mal_id'] = this.malId;
    data['rank'] = this.rank;
    data['title'] = this.title;
    data['url'] = this.url;
    data['image_url'] = this.imageUrl;
    data['type'] = this.type;
    data['episodes'] = this.episodes;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['members'] = this.members;
    data['score'] = this.score;
    return data;
  }
}