import 'package:flutter/material.dart';

class Liquidate extends StatelessWidget {
  int? itemPrise;
  int? itemCount;

  Liquidate(this.itemPrise,this.itemCount);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.2,
          child: Center(
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Center(child: Text('$itemCount'),),
                ),
                Text('${itemPrise}원 주문하기')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
