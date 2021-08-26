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
          child: GestureDetector(
              onTap: () {
                if (value == 'WebVPN') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddServer()));
                }
                if (value == 'Trojan') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddTrojan()));
                }
                if (value == 'L2TP') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddL2TP()));
                }
                if (value == 'AnyConnect') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddAnyConnect()));
                }
                if (value == 'Cisco IPsec') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddCiscoIPsec()));
                }
                if (value == 'VLESS') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddVLESS()));
                }
                if (value == 'VMESS') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddVMESS()));
                }
              },
              child: Text(value)),
        );
      }).toList(),
    );
  }
}
