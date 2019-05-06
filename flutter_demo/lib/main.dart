import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_demo/exmflutter.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.yellow,
      ),
      title: "Welcome to Flutter",
      home: new RandomWords(),
    );
//    return MaterialApp(
//      title: 'Welcome to Flutter',
//      home: new Scaffold(
////        appBar: new AppBar(
////          title: new Text("Welcome to Flutter"),
////        ),
//        body: new Center(
//          child: new RandomWords(),
//        ),
//      ),
//    );
  }
}

class RandomWords extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RandomWordState();
  }

}
class RandomWordState extends State<RandomWords>{
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 17);
  final _saved = new Set<WordPair>();
  
   Widget _buildSuggestions(){
   return new ListView.builder(
       padding: const EdgeInsets.all(16.0),
       itemBuilder: (context,i){
       if (i.isOdd) return new Divider();
       final index = i ~/ 2;
       if (index >= _suggestions.length){
         _suggestions.addAll(generateWordPairs().take(10));
       }
       return _buildRow(_suggestions[index]);
   });
 }
 Widget _buildRow(WordPair pair){
   final alreadySaved = _saved.contains(pair);

   return new ListTile(
       title: new Text(
         pair.asPascalCase,
         style: _biggerFont,
       ),
     trailing: new Icon(
         alreadySaved ? Icons.favorite : Icons.favorite_border,
         color: alreadySaved ? Colors.red : null,
         ),
     onTap: (){
         setState(() {
           if (alreadySaved){
             _saved.remove(pair);
           }else{
             _saved.add(pair);
           }
         });
     },
     );
 }
 void _pushSaved(){
   Navigator.push(context, new MaterialPageRoute(builder: (context){
     return new ExamFlutter();
   }));

//     Navigator.of(context).push(



//      new MaterialPageRoute(builder: (context){
//        final tiles = _saved.map((pair){
//          return new ListTile(
//            title: new Text(
//              pair.asPascalCase,
//              style: _biggerFont,
//            ),
//          );
//        });
//
//        final divided = ListTile.divideTiles(tiles: tiles,context: context).toList();
//
//       return new Scaffold(appBar: new AppBar(
//         title: new Text("Saved Suggest"),
//       ),
//       body: new ListView(children:divided),);
//      },),
//     );
 }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    final wordPair = new WordPair.random();
//    return new Text(wordPair.asPascalCase);
  return new Scaffold(
    appBar: new AppBar(
      title: Text("Startup Name Generator"),
      actions: <Widget>[
        new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
      ],
    ),
    
    body: _buildSuggestions(),
  );
  }

}