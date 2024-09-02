
import 'package:flutter/material.dart';
import 'package:movie_app/data/models/character_model.dart';
import 'package:movie_app/presentation/views/information_view.dart';

class CustomCardForEachCharacter extends StatelessWidget {
  const CustomCardForEachCharacter({super.key, required this.character});
  final CharacterModel character ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return  InformationView(
            character: character,
            
          ) ;
        })) ;
      },
      child: Container(
        height: 300,
         decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white, 
                width: 5.0,         
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
          child: Stack(
          children: [
            
            Image.network(
              character.image,
              height: 300,
              fit: BoxFit.fitHeight,
            ),
             Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container
              (
                
                color:  Colors.black.withOpacity(0.5),
                child: Center(
                  child: Text(
                    character.name ,
                    style:const TextStyle(
                      fontSize: 16 ,
                      color: Colors.white,
                ),))),
              ),
          ],
        ),
      ),
    );
  }
}