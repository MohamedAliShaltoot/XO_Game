import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ElevBun extends StatelessWidget {
  String label;
  Function onCleck;
  int index;
  
  ElevBun(
    {super.key,
    required this.label,
    required this.onCleck,
    required this.index,
    });

  @override
  Widget build(BuildContext context) {
    //int color=index+1;
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 11, 36, 56),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        onPressed: () {
          onCleck(index);
        },
        child:  Text(
          label,
          style: const TextStyle(
              fontSize: 60, color:  Colors.white, fontWeight: FontWeight.w100),
        ),
      ),
    );
  }
}