import 'package:covid_app/application/helpers/interfaces/mapper.dart';
import 'package:covid_app/domain/models/vaccine_info_model.dart';

class VaccInfoMapper extends Mapper<VaccineInfo> {
  @override
  VaccineInfo fromMap(Map<String, dynamic> json) => VaccineInfo(
    data: List<Datum>.from(json["data"].map((x) => DatumMapper().fromMap(x))),
    source: json['source'],
    totalCandidates: json['totalCandidates']
  );

  @override
  Map<String, dynamic> toMap(VaccineInfo data) => throw UnimplementedError();
  
}

class DatumMapper extends Mapper<Datum> {
  @override
  Datum fromMap(Map<String, dynamic> json) => Datum(
    candidate: json['candidate'],
    details: json['details'],
    institutions: List<String>.from(json["institutions"].map((x) => x)),
    mechanism: json['mechanism'],
    sponsors: List<String>.from(json["sponsors"].map((x) => x))
  );

  @override
  Map<String, dynamic> toMap(Datum data) => throw UnimplementedError();

}