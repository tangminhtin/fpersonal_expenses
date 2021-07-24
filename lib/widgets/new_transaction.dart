import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final title = titleController.text;
    final amount = double.parse(amountController.text);

    if (title.isEmpty || amount <= 0) {
      return;
    }

    widget.addNewTransaction(title, amount);
    Navigator.of(context).pop();
  }

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
                  color: Theme.of(context).primaryColor,
                ),
              ),
              controller: titleController,
              onSubmitted: (_) => submitData,
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Amount',
                labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              controller: amountController,
              onSubmitted: (_) => submitData,
            ),
            FlatButton(
              onPressed: submitData,
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
