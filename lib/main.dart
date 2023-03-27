import 'package:flutter/material.dart';

void main() {
  runApp( MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 192, 203, 1.0),
          title: Text('Retirement Calculator'),
        ),
        body: RetirementCalculator(),
      ),
    );
  }
}

class RetirementCalculator extends StatefulWidget {
  @override
  _RetirementCalculatorState createState() => _RetirementCalculatorState();
}

class _RetirementCalculatorState extends State<RetirementCalculator> {
  int _age = 0;
  int _retirementAge = 55;
  int _yearOfRetirement = 0;
  int _yearOfChild = 0;

  final _ageController = TextEditingController();
  final _yearController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _ageController,
          decoration: InputDecoration(
            labelText: 'Enter your age',
          ),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            setState(() {
              _age = int.parse(value);
              _yearOfRetirement = _retirementAge - _age;
            });
          },
        ),
        Text('You will retire in $_yearOfRetirement years(in case your retirement age is 55)'),
        TextField(
          controller: _yearController,
          decoration: InputDecoration(
            labelText: 'After how many years you want to have a child?',
          ),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            setState(() {
              _yearOfChild = int.parse(value);
            });
          },
        ),
        Text('Your child will turn 18 in ${_yearOfChild + 18} years'),
        Text('Your Child will be ${_yearOfRetirement - _yearOfChild} years old when you retired.')
      ],
    ) ;




  }
}
