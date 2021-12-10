import 'package:covid_app/infrastructure/mappers/home/timeline_mapper.dart';

import '../../../application/helpers/interfaces/mapper.dart';
import '../../../domain/models/historical_model.dart';

class HistoricalRespMapper extends Mapper<HistoricalResponse> {
  @override
  HistoricalResponse fromMap(Map<String, dynamic> json) => HistoricalResponse(
    country: json['country'],
    province: List<String>.from(json["province"].map((x) => x)),
    timeline: TimelineMapper().fromMap(json['timeline'])
  );

  @override
  Map<String, dynamic> toMap(HistoricalResponse data)
    => throw UnimplementedError();

}