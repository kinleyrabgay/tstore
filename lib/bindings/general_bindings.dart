import 'package:get/get.dart';
import 'package:tstore/common/network/internet.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
