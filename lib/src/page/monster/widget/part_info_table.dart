import 'package:flutter/material.dart';

import '../../../model/monster.dart';

class PartInfoTable extends StatelessWidget {
  const PartInfoTable({
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
                label: Text(
                  'HP',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Break',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Extract',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
            rows: monster.partStats.map((PartStat partStat) {
              final cells = <DataCell>[];
              partStat.toJson().forEach((name, value) {
                cells.add(
                  DataCell(
                    Text(
                      value,
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                      style: name != 'extract'
                          ? const TextStyle(fontSize: 25)
                          : TextStyle(
                              fontSize: 25,
                              color: value == 'Red'
                                  ? Colors.redAccent
                                  : value == 'Orange'
                                      ? Colors.orangeAccent
                                      : Colors.grey,
                            ),
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
