import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waxapp/providers/settings.dart';
import 'package:waxapp/screens/home.dart';
import 'package:waxapp/services/firestore_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final FireStoreService _db = FireStoreService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(      create: (_) => SettingsProvider(),
        ),
        StreamProvider(create: (_) => _db.getReports())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home(),
      ),
    );
  }
}
