class VaccineInfo {
    VaccineInfo({
        required this.source,
        required this.totalCandidates,
        required this.data,
    });

    final String source;
    final String totalCandidates;
    final List<Datum> data;
}

class Datum {
    Datum({
        required this.candidate,
        required this.mechanism,
        required this.sponsors,
        required this.details,
        required this.institutions,
    });

    final String candidate;
    final String mechanism;
    final List<String> sponsors;
    final String details;
    final List<String> institutions;
}
