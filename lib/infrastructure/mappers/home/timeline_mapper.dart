import '../../../application/helpers/interfaces/mapper.dart';
import '../../../domain/models/historical_model.dart';

class TimelineMapper extends Mapper<Timeline> {
  @override
  Timeline fromMap(Map<String, dynamic> json) => Timeline(
    cases: Map.from(json["cases"]).map((k, v) => MapEntry<String, int>(k, v)),
    deaths: Map.from(json["deaths"]).map((k, v) => MapEntry<String, int>(k, v)),
    recovered: Map.from(json["recovered"]).map((k, v)
      => MapEntry<String, int>(k, v)),
  );

  @override
  Map<String, dynamic> toMap(Timeline data) => throw UnimplementedError();

}