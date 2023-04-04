
////THIS IS THE RIVERPORD STATE MANAGEMENT DEMO

import 'package:application1/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
void main(){
  runApp(ProviderScope(child:MyApp()));
}
final hello_river = Provider<String>((ref) => 'Riverpord');
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final abc = ref.watch(hello_river);
            return Center(
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(abc)
              ],
            ),
            );
          }
      ),
   );
  }
}

