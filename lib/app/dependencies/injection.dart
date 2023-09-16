import 'package:get_it/get_it.dart';
import 'package:lol_app/data/datasources/remote/riot_api_service.dart';
import 'package:lol_app/data/repositories/riot_api_repository_imp.dart';
import 'package:lol_app/domain/usecases/riot_api_usecase.dart';
import 'package:lol_app/presentation/blocs/detail/detail_cubit.dart';
import 'package:lol_app/presentation/blocs/riot/riot_cubit.dart';

class Injector {
  static void init(GetIt getIt) {
    getIt.registerLazySingleton(() => RiotApiService());
    getIt.registerLazySingleton(
        () => RiotApiRepositoryImp(getIt<RiotApiService>()));
    getIt.registerLazySingleton(
        () => RiotApiUsecase(getIt<RiotApiRepositoryImp>()));

    getIt.registerFactory(() => HomeCubit(getIt<RiotApiUsecase>()));
    getIt.registerFactory(() => DetailPageCubit(getIt<RiotApiUsecase>()));
  }
}
