import 'package:covid_app/application/widgets/drawer/mappers/options_mapper.dart';

import '../../../helpers/interfaces/mapper.dart';
import '../models/drawer_model.dart';

class DrawerMapper extends Mapper<DrawerModel> {
  @override
  DrawerModel fromMap(Map<String, dynamic> json) => DrawerModel(
    options: List<Option>.from(json["options"].map((x)
      => OptionsMapper().fromMap(x)))
  );

  @override
  Map<String, dynamic> toMap(DrawerModel data) => throw UnimplementedError();

}