import 'package:stacked/stacked.dart';

class ProductImagesViewModel extends IndexTrackingViewModel {
  final List<String> imageList;

  final Function(int) setCurrentIndex;

  ProductImagesViewModel(this.imageList, this.setCurrentIndex);

  onPageChanged(int val) {
    setCurrentIndex(val);
    setIndex(val);
  }
}
