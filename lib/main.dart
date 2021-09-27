import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: SizedBox(
            height: 40,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Get json data"),
              style: ElevatedButton.styleFrom(
                  primary: Colors.grey[600],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  side: const BorderSide(
                      color: Colors.transparent,
                      width: 5,
                      style: BorderStyle.solid),
                  elevation: 5),
            ),
          ),
        ),
      ),
    );
  }
}
