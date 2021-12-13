import '../../../helpers/interfaces/mapper.dart';
import '../models/drawer_model.dart';

class OptionsMapper extends Mapper<Option> {
  @override
  Option fromMap(Map<String, dynamic> json) => Option(
    title: json['title'],
    route: json['route'],
  );

  @override
  Map<String, dynamic> toMap(Option data) => throw UnimplementedError();

}