import 'package:find_inspiration/comman/translation_constants.dart';
import 'package:find_inspiration/presentation/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'presentation/themes/themes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TranslationConstants.FIND_INSPIRATION,
      theme: Themes.themeData,
      initialRoute: AppPages.INITIAL,
      getPages : AppPages.appPages,
    );
  }
}
