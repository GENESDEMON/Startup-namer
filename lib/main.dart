import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());
//main is an entry point for the app
//runapp starts the framework

class MyApp extends StatelessWidget { //stateless widget makes the app a widget

  @override //stateless widget must override build
  Widget build(BuildContext context) {
    //generates word pairs bymoving the word generation code from MyApp _RandomWordsState 
    return MaterialApp(
      title: 'Starup Name Generator',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: RandomWords(),
    );
  }
} 

class RandomWords extends StatefulWidget{
  @override
  _RandomWordsState createState() => _RandomWordsState();
}
class _RandomWordsState extends State<RandomWords>{
  void _pushSaved(){
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context){
          final tiles = _saved.map(
            (WordPair pair){
              return ListTile(
                title:  Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
            ).toList();

            return Scaffold(
              appBar: AppBar(
                title: Text('Favourite Suggestions'),
              ),
              body: ListView(children: divided),
            );
        }, ),
    );
  }
  //adds a state class
  final _suggestions = <WordPair>[];
  final _saved = Set<WordPair>(); //set stores the word pairing the user favourited. It doesn't allow duplicate entries
  final _biggerFont = TextStyle(fontSize: 18.0);

@override
Widget build (BuildContext context) {
return Scaffold(
  appBar: AppBar(
    title: Text('Startup Name Generator'),
    actions:[
      IconButton(icon:Icon(Icons.list), onPressed: _pushSaved),
    ],
  ) ,
  body: _buildSuggextions(),);
}
Widget _buildSuggextions() {
  //this method ListView that displays the suggested word pairing
  return ListView.builder(
    //list view class provides a builder property(item builder)
    padding: EdgeInsets.all(16.0),
    itemBuilder: /*1*/ (context, i) 
    //itembuilder is a factory builder and callback function specified as an anonymous function
    { //i is the row iterator
      if(i.isOdd) return Divider();
      final index = i ~/2; // divides i by 2 and returns an integer result
      if (index >= _suggestions.length){
        _suggestions.addAll(generateWordPairs().take(10)); //generate 10 more if you reach the end of the availabe word pairings
      }
      return _buildRow(_suggestions[index]);
    }
  );
}
Widget _buildRow(WordPair pair){
  final alreadySaved = _saved.contains(pair);
  return ListTile(
    title:Text(
      pair.asPascalCase,
      style:_biggerFont,
    ),
    trailing: Icon(
      alreadySaved ? Icons.favorite : Icons.favorite_border,
      color:alreadySaved ? Colors.red :null,
    ),
    onTap: (){
      setState(() {
        if(alreadySaved){
          _saved.remove(pair);
        } else{
          _saved.add(pair);
        }
      });
    },
    );
}
}

//itemBuilder callback is called once per word pairing and places each suggestion into a ListTile row 

