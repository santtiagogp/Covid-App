import '../../../application/helpers/interfaces/mapper.dart';
import '../../../domain/models/global_vaccination.dart';

class GlobalVaccMapper extends Mapper<GlobalVaccination> {
  @override
  GlobalVaccination fromMap(Map<String, dynamic> json) => GlobalVaccination(
    daily: json['daily'],
    dailyPerMillion: json['dailyPerMillion'],
    date: json['date'],
    total: json['total'],
    totalPerHundred: json['totalPerHundred']
  );

  @override
  Map<String, dynamic> toMap(GlobalVaccination data)
    => throw UnimplementedError();
  
}