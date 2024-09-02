import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/data/models/character_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit() : super(CharacterInitial());

  Future<void> fetchCharacters() async {
    emit(CharacterLoading());

    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      emit(CharacterFailure(errMessage: "No internet connection"));
      return;
    }

    Dio dio = Dio();
    try {
      Response response = await dio.get("https://rickandmortyapi.com/api/character");
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> dataList = jsonData["results"];
      List<CharacterModel> characters = dataList.map((json) => CharacterModel.fromJson(json)).toList();
      emit(CharacterSuccess(character: characters));
    } on DioException catch (e) {
      emit(CharacterFailure(errMessage: "no internet connection"));
    } catch (e) {
      emit(CharacterFailure(errMessage: 'An unexpected error occurred: ${e.toString()}'));
    }
  }
}
