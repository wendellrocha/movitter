import 'package:common/common.dart';
import 'package:dependencies/dependencies.dart';
import 'package:modules/modules.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<Dio>((i) => Dio()),
    Bind.lazySingleton<DioInterceptor>((i) => DioInterceptor()),
    Bind.lazySingleton<IHttpClientAdapter>(
      (i) => DioAdapter(
        dio: i(),
        options: BaseOptions(baseUrl: kBaseUrl),
        interceptors: [
          i<DioInterceptor>(),
        ],
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: SplashModule()),
    ModuleRoute('/home', module: HomeModule()),
  ];
}
