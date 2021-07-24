import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final day;
  final amount;
  final percent;

  ChartBar(this.day, this.amount, this.percent);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          FittedBox(
            child: Text(
              '\$${amount.toStringAsFixed(0)}',
            ),
          ),
          SizedBox(height: 5),
          Container(
            height: 70,
            width: 15,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.green,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(250, 235, 224, 1),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: percent,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Text(day.toString().substring(0, 2)),
        ],
      ),
    );
  }
}
