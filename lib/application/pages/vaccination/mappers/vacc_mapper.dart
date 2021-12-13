import '../../../helpers/interfaces/mapper.dart';
import '../models/vacc_model.dart';

class VaccMapper extends Mapper<VaccModel> {
  @override
  VaccModel fromMap(Map<String, dynamic> json) => VaccModel(
    chart: json['chart'],
    informationCard: json['information_card'],
    total: json['total']
  );

  @override
  Map<String, dynamic> toMap(VaccModel data) => throw UnimplementedError();

}