import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(initializerName: 'init')
void configureDependencies(String flavor) => getIt.init(environment: flavor);
