import 'package:flutter/material.dart';
import 'package:vtrspeed/customWidget/DropDownWidget.dart';

class AddServer extends StatefulWidget {
  const AddServer({Key? key, this.protocolType}) : super(key: key);

  final String? protocolType;

  @override
  _AddServerState createState() => _AddServerState();
}

class _AddServerState extends State<AddServer> {
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

class RowList extends StatelessWidget {
  const RowList({
    Key? key,
    required this.leadingText,
    required this.trailingText,
  }) : super(key: key);

  final String leadingText;
  final String trailingText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                width: 220,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: leadingText,
                      hintStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Text(
                trailingText,
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
