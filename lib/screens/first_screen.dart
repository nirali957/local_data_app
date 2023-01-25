import 'package:flutter/material.dart';
import 'package:local_data_app/screens/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  dynamic data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("First Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Data: $data",
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // data = await Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const SecondScreen(),
                //   ),
                // );
                // debugPrint("data ----------------->>> $data");

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondScreen(
                      callback: (val) {
                        debugPrint("val ------------------->> $val");
                        data = val;
                        setState(() {});
                      },
                    ),
                  ),
                );

                setState(() {});
              },
              child: const Text("Next Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
