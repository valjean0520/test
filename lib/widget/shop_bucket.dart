import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/shop_bucket_controller.dart';

class ShopBucketTile extends StatelessWidget {
  final shopBucketController = Get.put(ShopBucketController());

  final itemName;
  final networkImage;
  int itemPrise = 0;
  final marketName;

  ShopBucketTile(
  {super.key, this.itemName, this.networkImage, required this.itemPrise, this.marketName});

  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Row(
              children: [
                Obx(
                  () => shopBucketController.selectEveryTile.value == false
                      ? SizedBox(
                          width: 30,
                          height: 30,
                          child: Checkbox(
                              value: shopBucketController
                                          .shopBucketTileCheck.value ==
                                      true
                                  ? true
                                  : false,
                              onChanged: (value) {
                                shopBucketController
                                            .shopBucketTileCheck.value !=
                                        true
                                    ? true
                                    : false;
                              }),
                        )
                      : Container(),
                ),
                Text('$itemName')
              ],
            ),
            Obx(() => shopBucketController.selectEveryTile.value
                ? TextButton(onPressed: () {}, child: const Text('삭제'))
                : Container())
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.width * 0.25,
              child: Image.network(networkImage),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$itemPrise 원'),
                Text('$marketName'),
                const SizedBox(),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        itemCount< 1 ? itemCount-- : itemCount;
                        shopBucketController.fnTotalItemCountRemove();
                      },
                      child: Container(
                        color: itemCount <= 1 ? Colors.grey : Colors.black,
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: const Icon(Icons.remove),
                      ),
                    ),
                    Obx(() => Text('$itemCount')),
                    InkWell(
                      onTap: () {
                        itemCount++;
                        shopBucketController.fnTotalItemCountAdd();
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: const Icon(Icons.add),
                      ),
                    ),
                  ],
                )
              ],
            ))
          ],
        )
      ],
    );
  }
}
