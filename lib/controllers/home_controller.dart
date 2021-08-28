import 'package:circadia/provider/data_provider.dart';
import 'package:get/get.dart';
class HomeController extends GetxController with StateMixin<List<dynamic>> {


  @override
  void onInit() {
    super.onInit();
    UserProvider().getUser().then((resp) {
      change(resp, status: RxStatus.success());
    }, onError: (err) {

      change(
        null,
        status: RxStatus.error(err.toString()),
      );
    });

  }

}