import '../../../helpers/interfaces/mapper.dart';
import '../models/settings_page_model.dart';
import 'options_mapper.dart';

class SettingsMapper extends Mapper<SettingsModel> {
  @override
  SettingsModel fromMap(Map<String, dynamic> json) => SettingsModel(
    title: json['title'],
    options: List<Option>.from(json["options"].map((x)
      => OptionsMapper().fromMap(x)))
  );

  @override
  Map<String, dynamic> toMap(SettingsModel data) => throw UnimplementedError();

}