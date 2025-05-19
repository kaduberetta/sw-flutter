import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> configureDependencies() async {
  // Register your dependencies here, for example:
  // sl.registerSingleton<SomeService>(SomeServiceImpl());
  await sl.allReady();
}
