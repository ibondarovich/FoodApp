import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'app/food_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  adapters.initAdapters();
  await hiveBoxes.openBoxes();
  await dataDI.initDependencies();
  await navigationDI.setupNavigationDependencies();
  runApp(const FoodApp());
}