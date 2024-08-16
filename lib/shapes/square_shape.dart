import 'package:flutter/material.dart';

class SquareShape extends StatelessWidget {
  const SquareShape({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: index == 0 ? Colors.transparent : Colors.transparent,
              border: Border.all(color: Colors.cyan),
              boxShadow: index == 0
                  ? [
                      BoxShadow(
                        color: Colors.transparent.withOpacity(0.0),
                        spreadRadius: 0,
                        blurRadius: 0,
                        offset: const Offset(0, 3),
                      ),
                    ]
                  : [],
            ),
            child: TextFormField(
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.phone,
            ),
          );
        }),
      ),
    );
  }
}
