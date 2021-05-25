import 'package:flutter/material.dart';
import 'package:movieapp/apis/api_data.dart';
import 'package:movieapp/models/model.dart';
import 'package:movieapp/views/home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider(
          create: (context) => ApiData.getData(),
          initialData: UserModel(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
