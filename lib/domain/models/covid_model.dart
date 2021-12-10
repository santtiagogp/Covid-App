class CovidResponse {
    CovidResponse({
        required this.updated,
        required this.country,
        required this.countryInfo,
        required this.cases,
        required this.todayCases,
        required this.deaths,
        required this.todayDeaths,
        required this.recovered,
        required this.todayRecovered,
        required this.active,
        required this.critical,
        required this.casesPerOneMillion,
        required this.deathsPerOneMillion,
        required this.tests,
        required this.testsPerOneMillion,
        required this.population,
        required this.continent,
        required this.oneCasePerPeople,
        required this.oneDeathPerPeople,
        required this.oneTestPerPeople,
        required this.activePerOneMillion,
        required this.recoveredPerOneMillion,
        required this.criticalPerOneMillion,
    });

    final int updated;
    final String country;
    final CountryInfo countryInfo;
    final int cases;
    final int todayCases;
    final int deaths;
    final int todayDeaths;
    final int recovered;
    final int todayRecovered;
    final int active;
    final int critical;
    final int casesPerOneMillion;
    final int deathsPerOneMillion;
    final int tests;
    final int testsPerOneMillion;
    final int population;
    final String continent;
    final int oneCasePerPeople;
    final int oneDeathPerPeople;
    final int oneTestPerPeople;
    final double activePerOneMillion;
    final double recoveredPerOneMillion;
    final double criticalPerOneMillion;

}

class CountryInfo {
    CountryInfo({
        required this.id,
        required this.iso2,
        required this.iso3,
        required this.lat,
        required this.long,
        required this.flag,
    });

    final int id;
    final String iso2;
    final String iso3;
    final double lat;
    final double long;
    final String flag;

}
