import 'package:get/get.dart';

class ShopBucketController extends GetxController {
  RxList shopBucketList = [].obs;

  RxBool shopBucketTileCheck = false.obs;
  RxBool selectEveryTile = false.obs;
  RxInt totalItemCount = 0.obs;

  void fnSelectEveryTile() {
    selectEveryTile.value == true
        ? shopBucketTileCheck.value = true
        : shopBucketTileCheck.value = false;
  }

  void fnTotalItemCountAdd(){
    totalItemCount++;
  }

  void fnTotalItemCountRemove(){
    totalItemCount !< 1 ? totalItemCount-- : totalItemCount;
  }
}
