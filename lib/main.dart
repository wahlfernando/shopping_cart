import 'package:flutter/material.dart';
import 'src/routes/app_pages.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Shooping Card",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}

