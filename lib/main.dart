import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'movies_list_view_model.dart';
import 'screens/movies_screen.dart';

//https://www.appsdeveloperblog.com/mvvvm-design-pattern-in-flutter/
void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Movies MVVM Example",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.teal),
        home: ChangeNotifierProvider(
          create: (context) => MovieListViewModel(),
          child: MovieListPage(),
        ));
  }
}
