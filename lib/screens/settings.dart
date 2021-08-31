import 'package:flutter/material.dart';
import 'package:vtrspeed/customWidget/DropDownWidget.dart';
import 'package:vtrspeed/serverscreens/addAnyConnect.dart';
import 'package:vtrspeed/serverscreens/addCiscoIPsec.dart';
import 'package:vtrspeed/serverscreens/addTrojan.dart';
import 'package:vtrspeed/serverscreens/addVLESS.dart';
import 'package:vtrspeed/serverscreens/addVMESS.dart';
import 'package:vtrspeed/serverscreens/add_L2TP.dart';
import 'package:vtrspeed/serverscreens/addserver.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool valuee = false;
  bool secondSwitch = false;
  bool thirdSwitch = false;
  bool fourthSwitch = false;

  String dropdownValue = 'AnyConnect';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
        leading: Icon(
          Icons.list_outlined,
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context, dropdownValue);
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 18.0, bottom: 10),
              child: Text(
                'General',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ),
            rowList(
              title: 'Protocol',
              trailingWidget: DropdownButton<String>(
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
              ),
              subtitle:
                  'The server list would refresh/change when protocol changed',
            ),
            rowList(
              title: 'App Proxy',
              subtitle: 'Include or exclude app from VPN',
              trailingWidget: DropDownWidget(),
            ),
            rowList(
              title: 'Routing Rules',
              trailingWidget: DropDownWidget(),
            ),
            rowList(
              title: 'Show Traffic',
              trailingWidget: Switch(
                value: valuee,
                onChanged: (bool value) {
                  setState(() {
                    valuee = !valuee;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, bottom: 10),
              child: Text(
                'VMESS/TROJAN/VLESS',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ),
            rowList(
              title: 'Routing Rules',
              subtitle: 'Switch traffic when connect VMESS/TROJAN/VLESS',
              trailingWidget: DropDownWidget(),
            ),
            rowList(
              title: 'Allow InSecure TLS',
              trailingWidget: Switch(
                  value: secondSwitch,
                  onChanged: (bool value) {
                    setState(() {
                      secondSwitch = !secondSwitch;
                    });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, bottom: 10),
              child: Text(
                'Automatic',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ),
            rowList(
              title: 'Auto Update Server List',
              trailingWidget: Switch(
                  value: thirdSwitch,
                  onChanged: (bool value) {
                    setState(() {
                      thirdSwitch = !thirdSwitch;
                    });
                  }),
            ),
            rowList(
              title: 'Auto Reconnect',
              trailingWidget: Switch(
                  value: fourthSwitch,
                  onChanged: (bool value) {
                    setState(() {
                      fourthSwitch = !fourthSwitch;
                    });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, bottom: 10),
              child: Text(
                'About',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, bottom: 10),
              child: Text(
                  'Version: 20210517\nWebsite: https://www.vtrspeed.com\nTelegram: https://t.me/vtrspeed \nEmail: support@vpnteam.net'),
            ),
          ],
        ),
      ),
    );
  }
}

class rowList extends StatelessWidget {
  const rowList(
      {Key? key, this.subtitle, this.trailingWidget, required this.title})
      : super(key: key);
  final String? subtitle;
  final String title;
  final Widget? trailingWidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      child: Column(
        children: [
          ListTile(
            title: Text(title),
            subtitle: Row(
              children: [
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: TextStyle(fontSize: 9.0),
                  )
              ],
            ),
            trailing: trailingWidget,
          ),
          Divider()
        ],
      ),
    );
  }
}
