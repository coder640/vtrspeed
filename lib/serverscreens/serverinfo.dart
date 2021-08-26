import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vtrspeed/customWidget/DropDownWidget.dart';

import 'addserver.dart';

class ServerInfo extends StatefulWidget {
  const ServerInfo({Key? key}) : super(key: key);

  @override
  _ServerInfoState createState() => _ServerInfoState();
}

class _ServerInfoState extends State<ServerInfo> {
  bool val = false;
  bool val1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Edit Server',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Icon(
            Icons.check,
            color: Colors.black,
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
                DropDownWidget(),
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
          Row(
            children: [
              Text('XTLS Direct'),
              Switch(
                  value: val1,
                  onChanged: (val1) {
                    setState(() {
                      val1 = !val1;
                    });
                  })
            ],
          ),
        ],
      ),
    );
  }
}
