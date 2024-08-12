import 'package:bank_sampah/firebase_options.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/view/admin/bottom_navbar_admin/bottom_navbar_admin.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: ColorPrimary.primary100,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: BottomNavbarAdmin(),
    );
  }
}
