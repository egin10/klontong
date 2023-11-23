import 'package:klontong/domain/entity/product.dart';

class DetailProductState {
  late Product product;
  late bool isBusy;

  DetailProductState() {
    isBusy = false;
  }
}
