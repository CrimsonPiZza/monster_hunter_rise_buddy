import 'package:flutter/material.dart';
import 'package:mhr_buddy/src/model/item.dart';
import 'package:simple_shadow/simple_shadow.dart';

class ItemIcon extends StatelessWidget {
  const ItemIcon({Key? key, required this.item}) : super(key: key);
  final Item item;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          MediaQuery.of(context).size.width > MediaQuery.of(context).size.height
              ? MediaQuery.of(context).size.width * 1 / 4
              : MediaQuery.of(context).size.height * 1 / 4,
      child: Container(
        margin: const EdgeInsets.all(10),
        // padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              color: Color.fromRGBO(
                0,
                0,
                0,
                0.2,
              ),
              spreadRadius: 0.1,
            )
          ],
        ),
        child: Center(
          child: SimpleShadow(
            offset: const Offset(-1, 0),
            child: Image(
              height: 128,
              fit: BoxFit.contain,
              image: AssetImage(
                  'assets/images/items/${item.name.toLowerCase().replaceAll(" ", "_")}.png'),
            ),
          ),
        ),
      ),
    );
  }
}
