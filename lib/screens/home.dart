import 'dart:math';

import 'package:bmi/screens/result.dart';
import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  bool isMale = false;
  double highvalue = 170;
  int weight = 70;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
              child: Text(
        "Body Mass Index",
      ))),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Gender(context, "male"),
                  const SizedBox(
                    width: 15,
                  ),
                  Gender(context, "female"),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Height',
                        style: Theme.of(context).textTheme.displayMedium),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(highvalue.toStringAsFixed(1),
                            style: Theme.of(context).textTheme.displayLarge),
                        Text('CM',
                            style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                    Slider(
                      min: 90,
                      max: 220,
                      value: highvalue,
                      onChanged: (newValue) =>
                          setState(() => highvalue = newValue),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                info(context, "Weight"),
                const SizedBox(
                  width: 15,
                ),
                info(context, "Age")
              ],
            ),
          ),
          Container(
            color: Colors.teal,
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 16,
            child: TextButton(
              onPressed: () {
                var result = weight / pow(highvalue / 100, 2);
                //print(result);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Result(result: result, isMale: isMale, age: age),
                  ),
                );
              },
              child: Text(
                'Calculate',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ),
        ],
      )),
    );
  }

  Expanded info(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == 'Age' ? 'Age' : 'Weight',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 15),
            Text(
              type == 'Age' ? '$age' : '$weight',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () =>
                      setState(() => type == 'Age' ? age-- : weight--),
                  mini: true,
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: () =>
                      setState(() => type == 'Age' ? age++ : weight++),
                  mini: true,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Expanded Gender(BuildContext context, String type) {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        setState(() {
          isMale = type == "male" ? true : false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isMale && type == "male" || !isMale && type == "female"
                ? Colors.teal
                : Colors.blueGrey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            type == "male" ? const Icon(Icons.male) : const Icon(Icons.female),
            const SizedBox(
              height: 40,
            ),
            type == "male"
                ? Text('Male', style: Theme.of(context).textTheme.displayMedium)
                : Text('Female',
                    style: Theme.of(context).textTheme.displayMedium)
          ],
        ),
      ),
    ));
  }
}
