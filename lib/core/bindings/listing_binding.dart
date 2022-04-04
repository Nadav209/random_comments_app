import 'package:get/get.dart';
import 'package:random_comments_app/controller/listing_controller.dart';

class ListingBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ListingController());
  }
}
