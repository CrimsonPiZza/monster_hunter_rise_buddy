import 'package:flutter/material.dart';

import '../../../model/monster.dart';

class AilmentEffectivenessTable extends StatelessWidget {
  const AilmentEffectivenessTable({
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
                  'Ailment',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Buildup',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Decay',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Damage',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Duration',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
            rows: monster.ailmentEffectiveness
                .map((AilmentEffectiveness ailment) {
              final cells = <DataCell>[];
              ailment.toJson().forEach((name, value) {
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
