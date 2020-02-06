import 'dart:convert';
import 'package:flutter_pokemon_app/pokeDetail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'pokemon.dart';

void main() => runApp(MaterialApp(home: HomePage(),));

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}
class HomePageState extends State<HomePage>{

  var url = "https://raw.githubusercontent.com/Biuni/PokemonGo-Pokedex/master/pokedex.json";

  PokeHub pokeHub;


  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async{
    var res = await http.get(url);

    var decodeJson  = jsonDecode(res.body);

    pokeHub = PokeHub.fromJson(decodeJson);
    print(pokeHub.toJson());
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Pokemon"),
        backgroundColor: Colors.lightGreen,
      ),
      body: pokeHub == null ? Center(
        child: CircularProgressIndicator(),
      )
      :GridView.count(
        crossAxisCount: 2,
        children: pokeHub.pokemon.map((poke) => Padding(
          padding: const EdgeInsets.all(2.0),
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => PokeDetail(poke)
              ));
            },
            child: Hero(
              tag: poke.img,
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      child: Image.network(poke.img),
                    ),
                    Text(
                      poke.name,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          ))
          .toList()

      )
    );
  }

}

