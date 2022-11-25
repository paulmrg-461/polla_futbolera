class MatchEntity {
  String? sId;
  int? awayScore;
  List<String>? awayScorers;
  String? awayTeamId;
  bool? finished;
  String? group;
  int? homeScore;
  List<String>? homeScorers;
  String? homeTeamId;
  String? id;
  String? localDate;
  String? matchday;
  String? persianDate;
  String? stadiumId;
  String? timeElapsed;
  String? type;
  String? homeTeamFa;
  String? awayTeamFa;
  String? homeTeamEn;
  String? awayTeamEn;
  String? homeFlag;
  String? awayFlag;

  MatchEntity(
      {this.sId,
      this.awayScore,
      this.awayScorers,
      this.awayTeamId,
      this.finished,
      this.group,
      this.homeScore,
      this.homeScorers,
      this.homeTeamId,
      this.id,
      this.localDate,
      this.matchday,
      this.persianDate,
      this.stadiumId,
      this.timeElapsed,
      this.type,
      this.homeTeamFa,
      this.awayTeamFa,
      this.homeTeamEn,
      this.awayTeamEn,
      this.homeFlag,
      this.awayFlag});

  MatchEntity.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    awayScore = json['away_score'];
    awayScorers = json['away_scorers'].cast<String>();
    awayTeamId = json['away_team_id'];
    finished = json['finished'] == 'TRUE' ? true : false;
    group = json['group'];
    homeScore = json['home_score'];
    homeScorers = json['home_scorers'].cast<String>();
    homeTeamId = json['home_team_id'];
    id = json['id'];
    localDate = json['local_date'];
    matchday = json['matchday'];
    persianDate = json['persian_date'];
    stadiumId = json['stadium_id'];
    timeElapsed = json['time_elapsed'];
    type = json['type'];
    homeTeamFa = json['home_team_fa'];
    awayTeamFa = json['away_team_fa'];
    homeTeamEn = json['home_team_en'];
    awayTeamEn = json['away_team_en'];
    homeFlag = json['home_flag'];
    awayFlag = json['away_flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['away_score'] = awayScore;
    data['away_scorers'] = awayScorers;
    data['away_team_id'] = awayTeamId;
    data['finished'] = finished;
    data['group'] = group;
    data['home_score'] = homeScore;
    data['home_scorers'] = homeScorers;
    data['home_team_id'] = homeTeamId;
    data['id'] = id;
    data['local_date'] = localDate;
    data['matchday'] = matchday;
    data['persian_date'] = persianDate;
    data['stadium_id'] = stadiumId;
    data['time_elapsed'] = timeElapsed;
    data['type'] = type;
    data['home_team_fa'] = homeTeamFa;
    data['away_team_fa'] = awayTeamFa;
    data['home_team_en'] = homeTeamEn;
    data['away_team_en'] = awayTeamEn;
    data['home_flag'] = homeFlag;
    data['away_flag'] = awayFlag;
    return data;
  }
}
