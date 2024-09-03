import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/data/models/character_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit() : super(CharacterInitial());

  List<CharacterModel> _allCharacters = []; // Store all characters for filtering

  Future<void> fetchCharacters() async {
    emit(CharacterLoading());

    Dio dio = Dio();
    try {
      Response response = await dio.get("https://rickandmortyapi.com/api/character");
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> dataList = jsonData["results"];
      List<CharacterModel> characters = dataList.map((json) => CharacterModel.fromJson(json)).toList();
      
      _allCharacters = characters; // Store fetched characters
      emit(CharacterSuccess(character: characters));
    } on DioException catch (e) {
      emit(CharacterFailure(errMessage: "no internet connection"));
    } catch (e) {
      emit(CharacterFailure(errMessage: 'An unexpected error occurred: ${e.toString()}'));
    }
  }

  // Function to filter characters based on the first character of their name
  void filterCharactersByName(String searchText) {
    if (searchText.isEmpty) {
      emit(CharacterSuccess(character: _allCharacters)); // No filtering if search text is empty
    } else {
      final filteredCharacters = _allCharacters
          .where((character) => character.name
              .toLowerCase()
              .startsWith(searchText.toLowerCase()))
          .toList();
      emit(CharacterSuccess(character: filteredCharacters));
    }
  }

  // Function to reset the character list to the original fetched characters
  void resetCharacters() {
    emit(CharacterSuccess(character: _allCharacters));
  }
}
