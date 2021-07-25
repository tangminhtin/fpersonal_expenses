import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final day;
  final amount;
  final percent;

  ChartBar(this.day, this.amount, this.percent);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text(
                  '\$${amount.toStringAsFixed(0)}',
                  style: TextStyle(
                    fontFamily: Theme.of(context).textTheme.title!.fontFamily,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.6,
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
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text(
                  day.toString().substring(0, 2),
                  style: TextStyle(
                    fontFamily: Theme.of(context).textTheme.title!.fontFamily,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
