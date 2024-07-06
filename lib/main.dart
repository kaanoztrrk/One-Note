import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/app.dart';
import 'core/locator/locator.dart';
import 'model/category_model/category_model.dart';
import 'model/task_model/task_model.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(CategoryModelAdapter());
  await Hive.openBox<Task>('tasks');
  await Hive.openBox<CategoryModel>('categories');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await setupLocator();

  runApp(const App());
}
