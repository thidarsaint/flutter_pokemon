import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokemon_app/pokemon.dart';

class PokeDetail extends StatelessWidget{
  final Pokemon pokemon;
  PokeDetail(this.pokemon);

  bodyWidget(BuildContext context) => Stack(
    children: <Widget>[
      Positioned(
        height: MediaQuery.of(context).size.height/1.5,
        width: MediaQuery.of(context).size.width - 20,
        left: 10.0,
        top: MediaQuery.of(context).size.height*0.1,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 70.0,
              ),
              Text(
                pokemon.name,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                "Height: ${pokemon.height}",
              ),
              Text(
                "Weight: ${pokemon.weight}",
              ),
              Text(
                "Types:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: 
                  pokemon.type.map((t) => 
                      FilterChip(
                        backgroundColor: Colors.amber,
                        label: Text(t),
                        onSelected: (b){},
                      )
                  ).toList()
               
              ),
              Text(
                "Weakness:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:
                  pokemon.weaknesses.map((w) =>
                      FilterChip(
                        backgroundColor: Colors.red,
                        label: Text(w,
                          style: TextStyle(color: Colors.white),

                        ),
                        onSelected: (b){},
                      )
                  ).toList()
              ),
              Text("Next Evolution", style: TextStyle(
                fontWeight: FontWeight.bold
              ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: pokemon.nextEvolution == null ? <Widget>[Text('This is the final form.')]
                    : pokemon.nextEvolution.map((n) => 
                    FilterChip(
                      backgroundColor: Colors.lightGreen,
                      label: Text(n.name,
                        style: TextStyle(color: Colors.white),
                      ),
                      onSelected: (b){},
                    )
                ).toList()
              )
            ],
          ),
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Hero(
          tag: pokemon.img,
          child: Image.network(pokemon.img, fit: BoxFit.cover,
            width: 150, height: 150,
          ),
        ),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.cyan,
        title: Text(pokemon.name),
      ),
      body: bodyWidget(context),
    );
  }


}