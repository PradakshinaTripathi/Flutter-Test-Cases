import 'package:flutter/material.dart';

import '../Functions/date_calculation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isClicked = false;
  TextEditingController controller = TextEditingController();
  int numberOfDays = 0;
  Date date = Date();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Unit Testing"),
      ),
      body: buildUI(),
    );
  }

  Widget buildUI() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          enterDateTextField(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              checkResult(),
              const SizedBox( width: 30,),
              clearResult()
            ],
          ),
            Visibility(
                visible: isClicked,
                child: dateToday())
        ],
      ),
    );
  }

  Widget enterDateTextField() {
    return SizedBox(
      width: 200,
      height: 40,
      child: TextField(
        key: Key("text_feild"),
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        ),
      ),
    );
  }

  Widget checkResult() {
    return ElevatedButton(
      onPressed: () {
        print("Clicked");
        setState(() {
          final isValidMonth = date.validationCheck(controller.text);
          if (isValidMonth) {
            isClicked = true;
            numberOfDays = date.noOfDaysInMonth(controller.text);
          } else {
            showInvalidInputSnackbar();
          }
        });
      },
      child: const Text("Check"),
    );
  }

  Widget clearResult(){
    return ElevatedButton(
      onPressed: () {
        setState(() {
          controller.clear();
          isClicked = false;
          numberOfDays = 0;
        });
      },
      child: const Text("Clear"),
    );
  }


  Widget dateToday() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "No. of days in ${controller.text} - $numberOfDays",
      ),
    );
  }
  void showInvalidInputSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Invalid input! Please enter a valid month.'),
      ),
    );
  }
}


