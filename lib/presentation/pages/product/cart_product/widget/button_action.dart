import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider.dart';

class ButtonAction extends StatelessWidget {
  const ButtonAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => context.read<CartProductProvider>().decrease(),
          icon: const Icon(
            Icons.remove_circle_outline_rounded,
            color: Colors.redAccent,
          ),
        ),
        const Text(
          "5",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        IconButton(
          onPressed: () => context.read<CartProductProvider>().increase(),
          icon: const Icon(
            Icons.add_circle_outline_rounded,
            color: Colors.redAccent,
          ),
        ),
        IconButton(
          onPressed: () => context.read<CartProductProvider>().remove(),
          icon: const Icon(
            Icons.delete_rounded,
            color: Colors.redAccent,
          ),
        ),
      ],
    );
  }
}
