import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vtrspeed/serverscreens/addAnyConnect.dart';
import 'package:vtrspeed/serverscreens/addCiscoIPsec.dart';
import 'package:vtrspeed/serverscreens/addVLESS.dart';
import 'package:vtrspeed/serverscreens/addVMESS.dart';
import 'package:vtrspeed/serverscreens/addserver.dart';
import 'package:vtrspeed/serverscreens/addTrojan.dart';
import 'package:vtrspeed/serverscreens/add_L2TP.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({Key? key}) : super(key: key);

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String dropdownValue = 'AnyConnect';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
      iconSize: 30,
      elevation: 16,
      style: const TextStyle(
        color: Colors.pink,
      ),
      underline: Container(
        height: 2,
        color: Colors.transparent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
        switch (newValue) {
          case "WebVPN":
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddServer(
                          protocolType: newValue,
                        )));
            break;
          case " L2TP":
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddL2TP(
                          protocolType: newValue,
                        )));
            break;
          case "AnyConnect":
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddAnyConnect(
                          protocolType: newValue,
                        )));
            break;
          case "Trojan":
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddTrojan(
                          protocolType: newValue,
                        )));
            break;
          case "Cisco IPsec":
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddCiscoIPsec(
                          protocolType: newValue,
                        )));
            break;
          case "VLESS":
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddVLESS(
                          protocolType: newValue,
                        )));
            break;
          case "VMESS":
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddVMESS(
                          protocolType: newValue,
                        )));
            break;
        }
      },
      items: <String>[
        'WebVPN',
        'L2TP',
        'AnyConnect',
        'Cisco IPsec',
        'VMESS',
        'Trojan',
        'VLESS',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
