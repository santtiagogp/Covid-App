class HistoricalResponse {
    HistoricalResponse({
        required this.country,
        required this.province,
        required this.timeline,
    });

    final String country;
    final List<String> province;
    final Timeline timeline;

}

class Timeline {
    Timeline({
        required this.cases,
        required this.deaths,
        required this.recovered,
    });

    final Map<String, int> cases;
    final Map<String, int> deaths;
    final Map<String, int> recovered;

}
