import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../model/monster.dart';

class MonsterIcon extends StatelessWidget {
  const MonsterIcon({Key? key, required this.monster}) : super(key: key);
  final Monster monster;
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
                  'assets/images/monsters/${monster.name.toLowerCase().replaceAll(" ", "_")}.png'),
            ),
          ),
        ),
      ),
    );
  }
}
