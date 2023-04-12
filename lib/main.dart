import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app/views/home_view.dart';

main() {
  runApp(AppWidget()); //para rodar o app
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //o primeiro widget do aplicativo deve ser o materialapp
      theme: ThemeData.dark(), //tema negro, não precisa fazer container ou algo diferente
      home: HomeView(),
    );
  }
}
