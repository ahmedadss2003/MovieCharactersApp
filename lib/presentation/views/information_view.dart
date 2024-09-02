import 'package:flutter/material.dart';
import 'package:movie_app/data/models/character_model.dart';
import 'package:movie_app/presentation/widgets/build_text_with_underline_for_information_view.dart';

class InformationView extends StatelessWidget {
  const InformationView({super.key, required this.character});
  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 300.0,
              floating: false,
              pinned: true,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                collapseMode: CollapseMode.parallax,
                title: Text(
                  character.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                background: Image.network(
                  character.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildTextWithUnderline(text: 'Name: ${character.name}'),
              BuildTextWithUnderline(text: 'Name: ${character.name}'),
              BuildTextWithUnderline(text: 'Name: ${character.species}'),
              BuildTextWithUnderline(text: 'Name: ${character.name}'),
              BuildTextWithUnderline(text: 'Name: ${character.created}'),
            ],
          ),
        ),
      ),
    );
  }

}
