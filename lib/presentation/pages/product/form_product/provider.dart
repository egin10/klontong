import 'package:flutter/material.dart';

import 'state.dart';

class FormProductProvider extends ChangeNotifier {
  final state = FormProductState();

  void submit(bool isUpdate) {
    if (isUpdate) {
      debugPrint("UPDATED");
    }
    
    debugPrint("INSERT");
  }
}
