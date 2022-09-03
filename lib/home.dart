import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:core';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({super.key});

  AppState createState() => AppState();
}

class AppState extends State {
  @override
  void initState() {
    // Sorting List in Ascending Order.

    super.initState();
  }

  final _textController = TextEditingController();

  //store number
  late String playerscores = " ";
  late String duplicateItem = " ";

  late List<String> Scores = [];
  late List<int> lint = [];
  late List<int> lint1 = [];
  var lint3rd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: TextField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[ 0-9]")),
                  FilteringTextInputFormatter.deny(RegExp("  ")),

                ],
                controller: _textController,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(width: 5)),
                    hintText: "Input player scores",
                    suffixIcon: IconButton(
                        onPressed: () {
                          _textController.clear();
                        },
                        icon: const Icon(Icons.clear))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: MaterialButton(
              onPressed: () {
                setState(() {
                  playerscores = _textController.text;
                  sorted();
                }
                );
              },
              color: Colors.blue,
              child: const Text(
                'Check',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Expanded(
                child:ListView.builder(
                itemCount: lint.length,
                itemBuilder: (BuildContext context, int index) {
                  return  Container(
                    height: 50,
                    margin: const EdgeInsets.all(2),
                    color: Colors.lightBlue,
                    child: Center(
                        child:
                        Text(
                          '${lint[index]}',
                          style: const TextStyle(fontSize: 24, color: Colors.white),
                        )
                    ),
                  );
                },
                ),
            ),
          Container(
            child: Text(
              '3rd Player Score',
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
            alignment: Alignment.center,
            height: 40,
            width: 600,
            margin: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.red,
            ),
          ),
          Center(
            child: Container(
              child: Text(
                '${lint3rd}',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              alignment: Alignment.center,
              height: 50,
              width:100,
              margin: EdgeInsets.fromLTRB(10,0,10,20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
              ),
            ),
          ),

        ],
      ),
    );
  }

  List<int> bubbleSort(List<int> array) {
    int lengthOfArray = array.length;
    for (int i = 0; i < lengthOfArray - 1; i++) {
      for (int j = 0; j < lengthOfArray - i - 1; j++) {
        if (array[j] > array[j + 1]) {
          // Swapping using temporary variable
          int temp = array[j];
          array[j] = array[j + 1];
          array[j + 1] = temp;
        }
      }
    }
    return (array);
  }



  void sorted() {

    Scores = playerscores.split(" ").map((String text) => (text)).toList();

    lint = Scores.map(int.parse).toList();


    List<int> sortedarray = bubbleSort(lint);
    print(sortedarray);

    //lint = lint..sort();
    lint = List.from(lint.reversed);
    print("Sorted Player Scores: ${lint}");

    lint1 = lint.toSet().toList();
    print("Sorted Player Scores Without Duplicates: ${lint1}");

    int duplicateDetectedCount = -1;
    for(String item in Scores){
      for(String innerItem in Scores){
        if(item == innerItem){
          duplicateDetectedCount++;
          if(duplicateDetectedCount == 1){
            duplicateItem = innerItem;
          }
        }
      }
    }
    print("Duplicate Score: $duplicateItem");

    lint3rd = lint1[2];
    print("3rd Place Player Score: ${lint3rd}");

    if (lint.any((item) => lint.contains(lint3rd))) {
      print("matched");
      // Lists have at least one common element
    } else {
      // Lists DON'T have any common element
      print("DID NOT matched");
    }


  }
}
