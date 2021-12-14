import 'package:covid_app/application/helpers/interfaces/mapper.dart';
import 'package:covid_app/application/pages/settings/models/settings_page_model.dart';

class OptionsMapper extends Mapper<Option> {
  @override
  Option fromMap(Map<String, dynamic> json) => Option(
    opt: json['opt']
  );

  @override
  Map<String, dynamic> toMap(Option data) => throw UnimplementedError();

}