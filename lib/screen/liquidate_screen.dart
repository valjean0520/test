import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/user_info_controller.dart';
import 'package:untitled/screen/home_screen.dart';

class LiquidateScreen extends StatelessWidget {
  int? liquiateMount;

  var now = DateTime.now();

  LiquidateScreen(this.liquiateMount, {super.key});

  final userInfoController = Get.put(UserInfoController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: liquiateMount! <= userInfoController.userMoney
              ? Column(
                  children: [
                    Row(
                      children: const [
                        Text('결제 완료'),
                      ],
                    ),
                    const Icon(Icons.add),
                    const Text('성공적으로 \n 결제가 진행되었습니다!'),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 0.5,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [const Text('결제금액'), Text('$liquiateMount')],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [const Text('결제 일시'), Text('$now')],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 0.5,
                      color: Colors.black,
                    ),
                    InkWell(
                      onTap: () {
                        userInfoController.userMoney - liquiateMount!;
                        Get.offAll(HomeScreen());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black)),
                        width: MediaQuery.of(context).size.width,
                        height: 30,
                        child: const Center(
                          child: Text('확인'),
                        ),
                      ),
                    )
                  ],
                )
              : Column(
                  children: [
                    Row(
                      children: const [
                        Text('결제 실패'),
                      ],
                    ),
                    const Icon(Icons.remove),
                    const Text('결제 실패중 문제가 발생했습니다.'),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 0.5,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [const Text('결제금액'), Text('$liquiateMount')],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [const Text('결제 일시'), Text('$now')],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 0.5,
                      color: Colors.black,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black)),
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      child: const Center(
                        child: Text('확인'),
                      ),
                    )
                  ],
                ),
        ));
  }
}
