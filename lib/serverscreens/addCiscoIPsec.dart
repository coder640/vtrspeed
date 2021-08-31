import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vtrspeed/customWidget/DropDownWidget.dart';

import 'addserver.dart';

class AddCiscoIPsec extends StatefulWidget {
  const AddCiscoIPsec({Key? key, this.protocolType}) : super(key: key);

  final String? protocolType;
  @override
  _AddCiscoIPsecState createState() => _AddCiscoIPsecState();
}

class _AddCiscoIPsecState extends State<AddCiscoIPsec> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Add Server',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Protocol Type'),
                Text(widget.protocolType!),
              ],
            ),
          ),
          RowList(
            leadingText: 'Remark',
            trailingText: 'Required',
          ),
          RowList(
            leadingText: 'ServerAddress',
            trailingText: 'Required',
          ),
          RowList(
            leadingText: 'Group Name',
            trailingText: 'Required',
          ),
          RowList(
            leadingText: 'IPSec PSK',
            trailingText: 'Required',
          ),
          RowList(
            leadingText: 'UserName',
            trailingText: 'Required',
          ),
          RowList(
            leadingText: 'Password',
            trailingText: 'Required',
          ),
        ],
      ),
    );
  }
}
