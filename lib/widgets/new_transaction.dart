import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addNewTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addNewTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(
                  color: Colors.purple,
                ),
              ),
              controller: titleController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount',
                labelStyle: TextStyle(
                  color: Colors.purple,
                ),
              ),
              controller: amountController,
            ),
            FlatButton(
              onPressed: () {
                addNewTransaction(
                  titleController.text,
                  double.parse(amountController.text),
                );
              },
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
