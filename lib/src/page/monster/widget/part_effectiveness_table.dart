import 'package:flutter/material.dart';

import '../../../model/monster.dart';

class PartEffectivenessTable extends StatelessWidget {
  const PartEffectivenessTable({
    Key? key,
    required this.monster,
  }) : super(key: key);

  final Monster monster;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: FittedBox(
          child: DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Part',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Image(
                  image: NetworkImage(
                      'https://cdn.kiranico.net/file/kiranico/mhrise-web/images/ui/hit_slash.png'),
                ),
              ),
              DataColumn(
                label: Image(
                  image: NetworkImage(
                      'https://cdn.kiranico.net/file/kiranico/mhrise-web/images/ui/hit_strike.png'),
                ),
              ),
              DataColumn(
                label: Image(
                  image: NetworkImage(
                      'https://cdn.kiranico.net/file/kiranico/mhrise-web/images/ui/hit_shell.png'),
                ),
              ),
              DataColumn(
                label: Image(
                  image: NetworkImage(
                      'https://cdn.kiranico.net/file/kiranico/mhrise-web/images/ui/element_fire.png'),
                ),
              ),
              DataColumn(
                label: Image(
                  image: NetworkImage(
                      'https://cdn.kiranico.net/file/kiranico/mhrise-web/images/ui/element_water.png'),
                ),
              ),
              DataColumn(
                label: Image(
                  image: NetworkImage(
                      'https://cdn.kiranico.net/file/kiranico/mhrise-web/images/ui/element_ice.png'),
                ),
              ),
              DataColumn(
                label: Image(
                  image: NetworkImage(
                      'https://cdn.kiranico.net/file/kiranico/mhrise-web/images/ui/element_thunder.png'),
                ),
              ),
              DataColumn(
                label: Image(
                  image: NetworkImage(
                      'https://cdn.kiranico.net/file/kiranico/mhrise-web/images/ui/element_dragon.png'),
                ),
              ),
              DataColumn(
                label: Image(
                  image: NetworkImage(
                      'https://cdn.kiranico.net/file/kiranico/mhrise-web/images/ui/element_stun.png'),
                ),
              ),
            ],
            rows: monster.partDamage.map((PartDamage partDamage) {
              final cells = <DataCell>[];
              partDamage.toJson().forEach((name, value) {
                cells.add(
                  DataCell(
                    Text(
                      value,
                      style: const TextStyle(fontSize: 25),
                    ),
                  ),
                );
              });
              return DataRow(cells: cells);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
