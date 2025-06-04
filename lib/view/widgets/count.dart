import 'package:flutter/material.dart';

class Count extends StatefulWidget {
  const Count({super.key});

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 1;
  bool isTrue = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade600),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isTrue == true
              ? Row(
                mainAxisAlignment: count < 10 ? MainAxisAlignment.spaceEvenly
            : MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      if (count > 1) {
                        setState(() {
                          count--;
                        });
                        return;
                      }
                      if (count == 1) {
                        setState(() {
                          isTrue = false;
                        });
                      }
                    },
                    child: Icon(Icons.remove, color: Color(0xffd6b738)),
                  ),
                  Text(
                    '$count',
                    style: TextStyle(
                      color: Color(0xffd6b738),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  InkWell(
                    onTap:
                        count == 100 || count > 100
                            ? null
                            : () {
                              setState(() {
                                count++;
                              });
                            },
                    child: Icon(Icons.add, color: Color(0xffd6b738)),
                  ),
                ],
              )
              : InkWell(
                onTap: () {
                  setState(() {
                    isTrue = true;
                  });
                },
                child: Text(
                  'ADD',
                  style: TextStyle(
                    color: Color(0xffd6b738),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
