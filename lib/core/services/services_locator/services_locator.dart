import 'package:get_it/get_it.dart';
import 'package:weather_app/features/home/presentation/view_model/search/search_bloc.dart';

import '../../../features/home/data/remote/weather_remote_ds.dart';
import '../../../features/home/data/repository/weather_repository.dart';
import '../../../features/weather_details/data/remote/weather_details_remote_ds.dart';
import '../../../features/weather_details/data/repository/weather_details_repository.dart';
import '../../../features/weather_details/presentation/view_model/bloc/weather_details_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    /// ------------------[home]------------------------------------------------------------------------
    sl.registerLazySingleton<WeatherRepository>(
        () => WeatherRepository(remoteDataSource: sl()));
    sl.registerLazySingleton<WeatherRemoteDataSource>(
        () => WeatherRemoteDataSource());
    sl.registerFactory<SearchBloc>(() => SearchBloc(repository: sl()));

    /// ------------------------------[details]------------------------------------------------------------
    sl.registerLazySingleton<WeatherDetailsRepository>(
        () => WeatherDetailsRepository(remoteDataSource: sl()));
    sl.registerLazySingleton<WeatherDetailsRemoteDs>(
        () => WeatherDetailsRemoteDs());
    sl.registerFactoryParam<WeatherDetailsBloc, String, void>(
      (cityName, _) => WeatherDetailsBloc(cityName: cityName, repository: sl()),
    );

    /// ------------------------------------------------------------------------------------------
  }
}
