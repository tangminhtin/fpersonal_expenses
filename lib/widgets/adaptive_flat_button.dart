import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String text;
  final VoidCallback handler;

  AdaptiveFlatButton(this.text, this.handler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.blue,
                  fontFamily: Theme.of(context).textTheme.title!.fontFamily),
            ),
            onPressed: handler,
          )
        : FlatButton(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.blue,
                  fontFamily: Theme.of(context).textTheme.title!.fontFamily),
            ),
            onPressed: handler,
          );
  }
}
