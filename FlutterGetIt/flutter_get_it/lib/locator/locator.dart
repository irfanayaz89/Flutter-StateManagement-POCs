import 'package:flutter_get_it/common/SharedPrefsRepo.dart';
import 'package:flutter_get_it/module/MoviesRepository.dart';
import 'package:flutter_get_it/module/movieDetail/MovieDetailViewModel.dart';
import 'package:flutter_get_it/module/movieDetail/MovieDetailRepository.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_get_it/module/movieList/MovieListViewModel.dart';
import 'package:flutter_get_it/network/apiBaseHelper.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {

  getIt.registerLazySingleton<ApiBaseHelper>(() => ApiBaseHelper());
  getIt.registerSingletonAsync<SharedPreferencesRepo>(() async {
    final SharedPreferencesRepo sharedPreferences = SharedPreferencesRepo();
    await sharedPreferences.init();
    return sharedPreferences;
  });
  getIt.registerFactoryParam<MovieDetailViewModel, int, void>((movieId, _) => MovieDetailViewModel(movieDetailRepository: MovieDetailRepository(), movieId: movieId));
  getIt.registerSingletonWithDependencies<MovieListViewModel>(() => MovieListViewModel(moviesRepository: MoviesRepository()), dependsOn: [SharedPreferencesRepo]);
}