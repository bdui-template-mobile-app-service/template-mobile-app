import 'package:flutter/material.dart';
import 'package:graduate_work/widgets/standard/src/text.dart';

class IncrementDecrementButtons extends StatelessWidget {
  final int value;
  final void Function() onIncrement;
  final void Function() onDecrement;

  const IncrementDecrementButtons({
    Key? key,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: value == 0 ? _buildTextState() : _buildButtonsState(),
    );
  }

  Widget _buildTextState() => GestureDetector(
        onTap: onIncrement,
        child: const Center(
          child: StandardText(
            'Добавить',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      );

  Widget _buildButtonsState() => Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            child: const Icon(Icons.remove, color: Colors.white),
            onTap: onDecrement,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 35,
            width: 60,
            child: Center(
              child: StandardText(
                value.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          GestureDetector(
            child: const Icon(Icons.add, color: Colors.white),
            onTap: onIncrement,
          ),
        ],
      );
}
