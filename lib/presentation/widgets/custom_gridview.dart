import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/business_logic/character/character_cubit.dart';
import 'package:movie_app/presentation/widgets/custom_card.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CharacterCubit>().fetchCharacters();
    return Expanded(
     child: BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) {
            if(state is CharacterLoading){
              return const Center(child:  CircularProgressIndicator()) ;
            }
            else if(state is CharacterSuccess){
                 return GridView.builder(
              itemCount: state.character.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent: 300,
              ),
              itemBuilder: (context, index) {
                return  CustomCardForEachCharacter(
                  character: state.character[index],
                );
              });
            }
            else if(state is CharacterFailure){
              return Text('Error: ${state.errMessage}');
            }
            else{
              return Container(
                width:10,
                
                color: Colors.red,
              ) ;
            }
        },
      ),
    );
  }
}
/*
child: BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) {
            if(state is CharacterLoading){
              return const CircularProgressIndicator() ;
            }
            else if(state is CharacterSuccess){
                 return GridView.builder(
              itemCount: state.character.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent: 300,
              ),
              itemBuilder: (context, index) {
                return const CustomCardForEachCharacter();
              });
            }
            else if(state is CharacterFailure){
              return Text('Error: ${state.errMessage}');
            }
            else{
              return Container(
                width:100,
                height:200 ,
                color: Colors.red,
              ) ;
            }
        },
      ),
*/