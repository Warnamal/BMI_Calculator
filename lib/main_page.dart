import 'package:flutter/material.dart';
import 'package:imb/constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 150;
  int weight = 70;

  late double bmi = calculateBMI(height: height, weight: weight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          color: colorChange(bmi),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage('images/height.png'),
                          height: 200,
                          width: 168,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage('images/weight.png'),
                          height: 200,
                          width: 158,
                        ),                        
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Height',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '$height',
                          style: kInputLabelColor,
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (height > 50) height--;
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 40,
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (height < 220) height++;
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                });
                              },
                              child: Icon(
                                Icons.add,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Weight',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '$weight',
                          style: kInputLabelColor,
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (weight > 20) weight--;
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 40,
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (weight < 250) weight++;
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                });
                              },
                              child: Icon(
                                Icons.add,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  Text(
                    'BMI',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmi.toStringAsFixed(2),
                    style: kInputLabelColor.copyWith(
                        color: kOutputTextColor, fontSize: 60),
                  ),
                  Text(
                    getResult(bmi),
                    style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                  ),
                  Image(
                    image: AssetImage('images/bmi.png'),
                    height: 200,
                    width: 350,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  double calculateBMI({required int height, required int weight}) {
    return weight / (height / 100 * height / 100);
  }

  String getResult(bmiValue) {
    if (bmiValue >= 30) {
      return 'Overweight';
    } else if (bmiValue >= 25) {
      return 'Excessweight';
    }else if (bmiValue >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  colorChange(double bmi) {
    if (bmi < 18.5) {
      return Color.fromARGB(255, 138, 203, 255);
    } else if (bmi > 18.5 && bmi < 24.9) {
      return Color.fromARGB(255, 118, 255, 123);
    } else if (bmi > 25 && bmi < 29.5) {
      return Color.fromARGB(255, 252, 230, 109);
    } else {
      return Color.fromARGB(255, 255, 125, 115);
    }
  }
}
 