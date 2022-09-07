import 'package:flutter/material.dart';

class SimpleItemInfo extends StatelessWidget {
  var itemName;
  var image;
  int? prise;
  var compayName;

  int quanity = 0;

  SimpleItemInfo(this.itemName, this.image, this.prise, this.compayName,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Text(
              '$itemName',
              style: const TextStyle(fontSize: 20),
            ),
            Row(
              children: [
                Column(
                  children: [
                    Container(child: Image.network(image)),
                  ],
                ),
                Column(
                  children: [
                    Text('$prise 원'),
                    Text('$compayName'),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove),
                          color: quanity > 0 ? Colors.black : Colors.grey,
                        ),
                        Text('$quanity'),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.add)),
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
