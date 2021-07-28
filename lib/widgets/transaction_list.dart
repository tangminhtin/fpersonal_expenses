import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final Function deleteTransaction;
  final List<Transaction> transactions;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Container(
      height: 500,
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    Container(
                      height: constraints.maxHeight * 0.2,
                      child: Text(
                        'No transactions added yet!',
                        style: TextStyle(
                          fontSize: 25,
                          color: Theme.of(context).primaryColor,
                          fontFamily:
                              Theme.of(context).textTheme.title!.fontFamily,
                        ),
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.1),
                    Container(
                      height: isLandscape
                          ? constraints.maxHeight * 0.7
                          : constraints.maxHeight * 0.5,
                      width: isLandscape
                          ? constraints.maxWidth * 0.5
                          : constraints.maxWidth * 0.7,
                      child: Image.asset(
                        'assets/images/empty.png',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ],
                );
              },
            )
          : ListView(
              children: transactions
                  .map((transaction) => TransactionItem(
                      key: ValueKey(transaction.id),
                      transaction: transaction,
                      deleteTransaction: deleteTransaction))
                  .toList(),
            ),
    );
  }
}
