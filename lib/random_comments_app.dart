import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_comments_app/core/bindings/listing_binding.dart';
import 'package:random_comments_app/prestation/page/listing_page.dart';

class RandomCommentsApp extends StatelessWidget {
  const RandomCommentsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "RandomCommentsApp",
      theme: ThemeData(primaryColor: Colors.blue),
      debugShowCheckedModeBanner: false,
      initialRoute: "/random_comments_app",
      getPages: [
        GetPage(
            name: '/random_comments_app',
            page: () => ListingPage(),
            binding: ListingBindings())
      ],
    );
  }
}
