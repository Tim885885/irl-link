import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:irllink/views/homeView.dart';
import 'package:irllink/views/loginView.dart';

void main() async {
  await GetStorage.init();
  runApp(Main());
}

final box = GetStorage();

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: box.read('twitchToken') == null ? LoginView() : HomeView(),
    );
  }
}
