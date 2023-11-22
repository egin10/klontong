import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.redAccent),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.red,
          ),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search",
                contentPadding: EdgeInsets.symmetric(vertical: 10)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
