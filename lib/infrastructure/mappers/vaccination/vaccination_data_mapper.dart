import '../../../application/helpers/interfaces/mapper.dart';
import '../../../domain/models/vacination_data.dart';

class VaccDataMapper extends Mapper<VaccinationData> {
  @override
  VaccinationData fromMap(Map<String, dynamic> json) => VaccinationData(
    country: json['country'],
    timeline: Map.from(json["timeline"]).map((k, v)
      => MapEntry<String, int>(k, v))
  );

  @override
  Map<String, dynamic> toMap(VaccinationData data)
    => throw UnimplementedError();
  
}