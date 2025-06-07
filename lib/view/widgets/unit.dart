import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Unit extends StatefulWidget {
final  List<String> unitsList;
  const Unit({super.key, required this.unitsList});

  @override
  State<Unit> createState() => _UnitState();
}

class _UnitState extends State<Unit> {
  String selectedUnit = '';

  @override
  void initState() {
    super.initState();
    selectedUnit = widget.unitsList.first; // یہاں پر initial value assign کریں
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          backgroundColor: Colors.white,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    margin: EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  ...widget.unitsList.map((data) {
                    return ListTile(
                      title: Text(
                        data,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        setState(() {
                          selectedUnit = data;
                          print(selectedUnit);
                        });
                        Navigator.pop(context); // bottom sheet بند کریں
                      },
                    );
                  }).toList(),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        padding: EdgeInsets.only(left: 3),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade600),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Text(
                    selectedUnit,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13),
                  ),
                ),
                Icon(Icons.arrow_drop_down, color: Color(0xffd6b738)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}