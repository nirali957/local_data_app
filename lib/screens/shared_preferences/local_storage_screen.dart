import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:local_data_app/model/to_do_model.dart';
import 'package:local_data_app/screens/shared_preferences/local_storage_second_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageScreen extends StatefulWidget {
  const LocalStorageScreen({Key? key}) : super(key: key);

  @override
  State<LocalStorageScreen> createState() => _LocalStorageScreenState();
}

class _LocalStorageScreenState extends State<LocalStorageScreen> {
  SharedPreferences? sharedPreferences;

  int counter = 0;
  int counterTwo = 0;

  ToDoModel? toDoModel;

  @override
  void initState() {
    // TODO: implement initState
    getInstanceData();
    super.initState();
  }

  // To get Shared Preferences instance --------->>>
  getInstanceData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    getData();
  }

  // To set data in Shared Preferences --------->>>
  setData() async {
    await sharedPreferences!.setInt('counter', 10);
    await sharedPreferences!.setInt('counter_two', 20);
  }

  // To get data from Shared Preferences --------->>>
  getData() async {
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

  // To set model in Shared Preferences --------->>>
  setModelData() async {
    ToDoModel toDoModel = ToDoModel(
      title: "1234567",
      date: "10/12/2002",
      time: "10:20 PM",
      description: "12345678901234567890",
    );

    await sharedPreferences!.setString('model_data', jsonEncode(toDoModel));
  }

  // To get model data from Shared Preferences --------->>>
  getModelData() {
    var data = jsonDecode(sharedPreferences!.getString('model_data')!);
    toDoModel = ToDoModel.fromJson(data);
    debugPrint("Data ------------>>> ${toDoModel!.title}");
    setState(() {});
  }

  // To remove data from Shared Preferences --------->>>
  removeData() {
    sharedPreferences!.remove("counter");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Preference"),
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
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LocalStorageSecondScreen(),
                  ),
                );
              },
              child: const Text("Next Screen"),
            ),
            ElevatedButton(
              onPressed: () {
                setModelData();
              },
              child: const Text("Set Model Data"),
            ),
            ElevatedButton(
              onPressed: () {
                getModelData();
              },
              child: const Text("Get Model Data"),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () {
                getData();
              },
              heroTag: "get data",
              child: const Icon(Icons.arrow_downward),
            ),
            FloatingActionButton(
              onPressed: () {
                setData();
              },
              heroTag: "set data",
              child: const Icon(Icons.arrow_upward),
            ),
            FloatingActionButton(
              onPressed: () {
                removeData();
              },
              heroTag: "remove data",
              child: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
