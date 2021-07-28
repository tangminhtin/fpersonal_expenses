import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/adaptive_flat_button.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction) {
    print('NewTransaction: constructor');
  }

  @override
  _NewTransactionState createState() {
    print('NewTransaction: createState()');
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _chosenDate = DateTime.now();

  _NewTransactionState() {
    print('NewTransaction: constructorState()');
  }

  @override
  void initState() {
    print('NewTransaction: initState()');
    super.initState();
  }

  @override
  void didUpdateWidget(covariant NewTransaction oldWidget) {
    print('NewTransaction: didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('NewTransaction: dispose()');
    super.dispose();
  }

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }

    final title = _titleController.text;
    final amount = double.parse(_amountController.text);

    if (title.isEmpty || amount <= 0) {
      return;
    }

    widget.addNewTransaction(title, amount, _chosenDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _chosenDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        color: Colors.green[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Container(
          padding: EdgeInsets.only(
            top: 25,
            right: 25,
            left: 25,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: Theme.of(context).textTheme.title!.fontFamily,
                  ),
                ),
                controller: _titleController,
                onSubmitted: (_) => _submitData,
              ),
              TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: 'Amount',
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: Theme.of(context).textTheme.title!.fontFamily,
                  ),
                ),
                controller: _amountController,
                onSubmitted: (_) => _submitData,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Picked date: ${DateFormat.yMd().format(_chosenDate)}',
                    style: TextStyle(
                      fontFamily: Theme.of(context).textTheme.title!.fontFamily,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  AdaptiveFlatButton('Choose date', _presentDatePicker),
                ],
              ),
              RaisedButton(
                color: Theme.of(context).textTheme.button!.color,
                onPressed: _submitData,
                child: Text(
                  'Add Transaction',
                  style: TextStyle(
                    fontFamily: Theme.of(context).textTheme.title!.fontFamily,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
