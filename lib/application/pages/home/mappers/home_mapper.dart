import '../../../helpers/interfaces/mapper.dart';
import '../models/home_model.dart';

class HomeMapper extends Mapper<HomeModel> {
  @override
  HomeModel fromMap(Map<String, dynamic> json) => HomeModel(
    active: json['active'],
    confirmed: json['confirmed'],
    deceased: json['deceased'],
    graphic: json['graphic'],
    informationCard: json['information_card'],
    recovered: json['recovered']
  );

  @override
  Map<String, dynamic> toMap(HomeModel data) => throw UnimplementedError();
  
}