import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/FunctionController.dart';

class Containers extends StatelessWidget {
  final Controllers controllers = Get.put(Controllers());
  final Color color;
  final bool selected;

  Containers({super.key, required this.color, required this.selected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controllers.selectContainer(color);
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          border: Border.all(
            color: selected ? Colors.black : Colors.transparent,
            width: 2,
          ),
        ),
      ),
    );
  }
}
