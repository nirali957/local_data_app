import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageSecondScreen extends StatefulWidget {
  const LocalStorageSecondScreen({Key? key}) : super(key: key);

  @override
  State<LocalStorageSecondScreen> createState() => _LocalStorageSecondScreenState();
}

class _LocalStorageSecondScreenState extends State<LocalStorageSecondScreen> {
  SharedPreferences? sharedPreferences;
  int counter = 0;
  int counterTwo = 0;

  @override
  void initState() {
    // TODO: implement initState
    getInstanceData();
    super.initState();
  }

  getInstanceData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    // getData();
  }

  getData() {
    if (sharedPreferences!.containsKey('counter')) {
      debugPrint("true");
      counter = sharedPreferences!.getInt('counter')!;
      counterTwo = sharedPreferences!.getInt('counter_two')!;
    } else {
      debugPrint("false");
      counter = 0;
      counterTwo = 0;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Preference Second"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Counter: $counter",
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "CounterTwo: $counterTwo",
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getData();
        },
        heroTag: "get data second",
        child: const Icon(Icons.arrow_downward),
      ),
    );
  }
}
