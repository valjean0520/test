import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/screen/liquidate_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ItemDetailInfo extends StatelessWidget {
  final getMoreInfo = Get.put(MoreInfo());

  final itemName;
  final itemPrise;
  final deliverPrise;
  final detail1;
  final detail2;
  final detail3;
  final marketName;
  final brand;
  final moreInfo;

  ItemDetailInfo(
      {this.itemPrise,
      this.marketName,
      this.itemName,
      this.brand,
      this.deliverPrise,
      this.detail1,
      this.detail2,
      this.detail3,
      this.moreInfo});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(children: [
      Column(
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.6,

            ///TODO: 그 머여 이미지 들들들 갖고와서 묶어야돼
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(itemName),
                Text(itemPrise),
                Container(
                  color: Colors.black,
                  width: MediaQuery.of(context).size.width,
                  height: 0.5,
                ),
                Text('배송비'),
                SizedBox(
                  height: 15,
                ),
                Text('Detail'),
                Text('{$detail1 > $detail2 > $detail1}'),
                Text('입몰점 $marketName'),
                Text('브랜드 $brand')
              ],
            ),
          ),
          Obx(
            () => Container(
              width: MediaQuery.of(context).size.width,
              height: getMoreInfo.isMoreInfoEnable.value
                  ? MediaQuery.of(context).size.height
                  : MediaQuery.of(context).size.height * 0.7,
            ),
          ),
          Padding(padding: EdgeInsets.all(10),
          child: InkWell(
            onTap: (){
              getMoreInfo.fnMoreInfoChange();
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 30,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                children: const [
                  Text('상품정보 더보기'),
                  Icon(Icons.keyboard_arrow_down)
                ],
              ),
            ),
          ),
          ),

          Row(
            children: [
              InkWell(
                onTap: (){
                  ///TODO : 잘 모르겠는 장바구니에 데이터 저장 아마 리스트로 보내면 될듯
                },
                child: Container(
                  decoration: BoxDecoration(border: Border.all(width: 1)),
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: const Center(
                    child: Text('장바구니담기'),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  ///TODO: 바로 결제하기 <-?
                  Get.to(LiquidateScreen(itemPrise));
                },
                child: Container(
                  color: Colors.black,
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: const Center(
                    child: Text('비로구매'),
                  ),
                ),
              )
            ],
          )
        ],
      )
    ]));
  }
}

class MoreInfo extends GetxController {
  RxBool isMoreInfoEnable = false.obs;

  void fnMoreInfoChange() {
    isMoreInfoEnable.value ? false : true;
  }
}

class MoreInfoTile extends StatelessWidget {
  final tileName;
  MoreInfoTile(this.tileName);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(tileName.toString()),
            SizedBox(),
            Icon(Icons.keyboard_arrow_down_outlined)
          ],
        ),
      ),
    );

  }
}

