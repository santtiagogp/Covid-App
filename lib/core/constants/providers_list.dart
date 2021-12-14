import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../application/pages/home/notifiers/country_notifier.dart';
import '../../application/pages/vaccination/notifier/vacc_notifier.dart';
import '../../domain/use_case/covid_usecase.dart';
import '../../domain/use_case/vaccination_usecase.dart';
import '../../infrastructure/repository/covid_repository.dart';
import '../../infrastructure/repository/vaccines_repository.dart';

final List<SingleChildWidget> appProviders = [
    ChangeNotifierProvider(
      create: (_) => HomeNotifier(CovidDataUseCase(CovidApi())),
    ),
    ChangeNotifierProvider(
      create: (_) => VaccNotifier(VaccDataUseCase(VaccinesApi())),
    )
];