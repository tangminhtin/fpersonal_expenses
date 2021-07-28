import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color? _bgColor;
  @override
  initState() {
    const availableColor = [
      Colors.green,
      Colors.indigo,
      Colors.purple,
      Colors.amber,
    ];
    _bgColor = availableColor[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.brown[50],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor, 
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Text(
                '\$${widget.transaction.amount.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: Theme.of(context).textTheme.title!.fontFamily,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMMd().format(widget.transaction.date),
          style: TextStyle(
            color: Colors.brown,
            fontFamily: Theme.of(context).textTheme.title!.fontFamily,
          ),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                icon: Icon(Icons.delete),
                label: Text('Delete'),
                textColor: Theme.of(context).errorColor,
                onPressed: () =>
                    widget.deleteTransaction(widget.transaction.id),
              )
            : IconButton(
                icon: Icon(Icons.delete, color: Theme.of(context).errorColor),
                onPressed: () =>
                    widget.deleteTransaction(widget.transaction.id),
              ),
      ),
    );
  }
}
