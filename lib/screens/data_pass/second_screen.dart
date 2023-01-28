import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  final Function(String) callback;
  const SecondScreen({Key? key, required this.callback}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textEditingController,
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.pop(context, textEditingController.text);
                widget.callback(textEditingController.text);
              },
              child: const Text("Back Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
