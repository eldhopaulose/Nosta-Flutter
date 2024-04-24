import 'package:e_commerse/app/modules/data/colors.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  final String categoryName;
  final bool isSelected;
  final Function(String) onPressed;

  Categories(
      {required this.categoryName,
      required this.onPressed,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: GestureDetector(
        onTap: () {
          onPressed(categoryName);
        },
        child: Container(
          width: 150,
          decoration: BoxDecoration(
            color: isSelected ? Colors.green : AppColor.blue,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  categoryName,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
