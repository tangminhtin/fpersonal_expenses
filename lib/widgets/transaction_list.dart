import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions added yet!',
                  style: TextStyle(
                    fontSize: 25,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  height: 250,
                  child: Image.asset(
                    'assets/images/empty.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.brown[50],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
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
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '\$${transactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transactions[index].title,
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            DateFormat.yMMMMd()
                                .format(transactions[index].date),
                            style: TextStyle(
                              color: Colors.brown,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
