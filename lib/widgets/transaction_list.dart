import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: transactions.map((t) {
            return Card(
              color: Colors.brown[50],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.pink,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '\$${t.amount}',
                      style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t.title,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat.yMMMMd().format(t.date),
                        style: TextStyle(
                          color: Colors.brown,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
