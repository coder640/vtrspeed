import 'package:flutter/material.dart';
import 'package:vtrspeed/customWidget/DropDownWidget.dart';

import 'addserver.dart';

class AddVMESS extends StatefulWidget {
  const AddVMESS({Key? key, this.protocolType}) : super(key: key);

  final String? protocolType;
  @override
  _AddVMESSState createState() => _AddVMESSState();
}

class _AddVMESSState extends State<AddVMESS> {
  bool val = false;

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
            leadingText: 'Port',
            trailingText: 'Required',
          ),
          RowList(
            leadingText: 'UUID',
            trailingText: 'Required',
          ),
          RowList(
            leadingText: 'Alter ID',
            trailingText: 'Required',
          ),
          Row(
            children: [
              Text('TLS'),
              Switch(
                  value: val,
                  onChanged: (val) {
                    setState(() {
                      val = !val;
                    });
                  })
            ],
          ),
        ],
      ),
    );
  }
}
