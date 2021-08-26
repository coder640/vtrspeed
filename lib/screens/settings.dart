import 'package:flutter/material.dart';
import 'package:vtrspeed/customWidget/DropDownWidget.dart';

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
            onPressed: () {},
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
              trailingWidget: DropDownWidget(),
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
