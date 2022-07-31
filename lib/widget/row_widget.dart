import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({
    Key? key,
    required this.title,
    required this.detail,
    required this.icon
  }) : super(key: key);

  final String title;
  final detail;
  final icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(icon),
                SizedBox(width: 10.0,),
                Text(
                  title,
                  style: const TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              detail.toString(),
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
