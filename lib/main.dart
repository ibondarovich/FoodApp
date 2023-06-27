import 'package:core/core.dart';
import 'package:data/di/data_di.dart';
import 'package:flutter/material.dart';
import 'package:core/config/di/firebase_options.dart';
import 'app/food_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dataDI.initDependencies();
  runApp(const FoodApp());
}