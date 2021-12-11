import '../../../application/helpers/interfaces/mapper.dart';
import '../../../domain/models/covid_model.dart';

class CountryInfoMapper extends Mapper<CountryInfo> {
  @override
  CountryInfo fromMap(Map<String, dynamic> json) => CountryInfo(
    id: json['_id'],
    iso2: json['iso2'],
    iso3: json['iso3'],
    lat: json['lat'].toDouble(),
    long: json['log'] ?? 0,
    flag: json['flag'] ?? 'https://www.segelectrica.com.co/wp-content/themes/consultix/images/no-image-found-360x250.png'
  );

  @override
  Map<String, dynamic> toMap(CountryInfo data) => throw UnimplementedError();

}