import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/business_logic/character/character_cubit.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar>
    with SingleTickerProviderStateMixin {
  bool _isActive = false;
  String _searchText = "";

  void _onSearchChanged(String text) {
    setState(() {
      _searchText = text;
    });

    // Trigger the search function in the CharacterCubit
    context.read<CharacterCubit>().filterCharactersByName(_searchText);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!_isActive)
          Text("Search for characters",
              style: Theme.of(context).appBarTheme.titleTextStyle),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: AnimatedSize(
              duration: const Duration(milliseconds: 250),
              child: _isActive
                  ? Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.0)),
                      child: TextField(
                        onChanged: _onSearchChanged,
                        decoration: InputDecoration(
                            hintText: 'Search for characters',
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isActive = false;
                                    _searchText = "";
                                  });
                                  context
                                      .read<CharacterCubit>()
                                      .fetchCharacters(); // Reset to original list
                                },
                                icon: const Icon(Icons.close))),
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          _isActive = true;
                        });
                      },
                      icon: const Icon(Icons.search)),
            ),
          ),
        ),
      ],
    );
  }
}
