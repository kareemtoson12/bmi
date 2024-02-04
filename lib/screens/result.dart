import 'package:bmi/screens/home.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(
      {super.key,
      required this.result,
      required this.isMale,
      required this.age});

  final double result;
  final bool isMale;
  final int age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHome(),
                  ));
            },
          ),
          title: Center(
            child: Text(
              'Result',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          )),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Gender :${isMale ? 'Male' : 'Female'}',
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
            Text(
              'Result:${result.toStringAsFixed(1)}',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Text(
              'Healthness:${getresult(result)}',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Text(
              'Age:$age',
              style: Theme.of(context).textTheme.displayLarge,
            )
          ],
        ),
      )),
    );
  }
}

String getresult(result) {
  if (result < 18.5) {
    return 'UnderWeight';
  } else if (result > 18.5 && result < 24.9) {
    return 'Normal';
  } else if (result > 25 && result < 29.9) {
    return 'Overweight';
  } else if (result > 30) {
    return 'Obese';
  } else {
    return '';
  }
}
