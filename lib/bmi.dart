import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  int height = 180;
  int weight = 60;
  var result = "Welcome to BMI Calculator";
  Color bgcolor = Color(0xFF0A0E21);
  var msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Container(
        color: bgcolor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        color: Color(0xFF1D1E33),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'HEIGHT',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white70,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  height.toString(),
                                  style: TextStyle(
                                    fontSize: 36.0,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Text(
                                  'cm',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                            Slider(
                              value: height.toDouble(),
                              min: 120.0,
                              max: 220.0,
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.round();
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        color: Color(0xFF1D1E33),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white70,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              weight.toString(),
                              style: TextStyle(
                                fontSize: 36.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  backgroundColor: Color(0xFF4C4F5E),
                                  child: Icon(Icons.remove),
                                ),
                                SizedBox(width: 16.0),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  backgroundColor: Color(0xFF4C4F5E),
                                  child: Icon(Icons.add),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Center(
                  child: Text(
                "$msg\n$result",
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              )),
            ),
            Container(
              margin: EdgeInsets.all(16),
              color: Color(0xFFEB1555),
              width: double.infinity,
              height: 60.0,
              child: TextButton(
                onPressed: () {
                  var meter = height / 100;

                  var bmi = weight / (meter * meter);

                  // providing tips & background colour according to BMI
                  if (bmi > 25) {
                    msg = "You are OverWeight";
                    bgcolor = Colors.red.shade300;
                  } else if (bmi < 18) {
                    msg = "You are UnderWeight";
                    bgcolor = Colors.orange.shade300;
                  } else {
                    msg = "You are healthy";
                    bgcolor = Colors.green.shade300;
                  }

                  setState(() {
                    result = "Your BMI is : ${bmi.toStringAsFixed(2)}";
                  });
                },
                child: const Text(
                  'CALCULATE',
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget? child;

  ReusableCard({required this.color, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
