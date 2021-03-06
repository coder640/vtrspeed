import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vtrspeed/connectionScreens/connecting.dart';
import 'package:vtrspeed/customWidget/drawerWidget.dart';
import 'package:vtrspeed/page/country_page.dart';
import 'package:vtrspeed/screens/settings.dart';

class Connect extends StatefulWidget {
  const Connect({Key? key}) : super(key: key);

  @override
  _ConnectState createState() => _ConnectState();
}

final GlobalKey<ScaffoldState> _drawerkey = GlobalKey<ScaffoldState>();

class _ConnectState extends State<Connect> {
  String _information = 'USA';

  String _serverProtocol = 'AnyConnect';

  void updateInformation(String information) {
    setState(() => _information = information);
  }

  void updateServerInformation(String serverProtocol) {
    setState(() => _serverProtocol = serverProtocol);
  }

  void moveToSecondPage() async {
    final information = await Navigator.push(
      context,
      CupertinoPageRoute(
          fullscreenDialog: true, builder: (context) => ChooseLocation()),
    );
    updateInformation(information);
  }

  void moveToSetting() async {
    final serverProtocol = await Navigator.push(
      context,
      CupertinoPageRoute(
          fullscreenDialog: true, builder: (context) => Settings()),
    );
    updateServerInformation(serverProtocol);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _drawerkey,
      drawer: Container(
        width: width - 60,
        child: Drawer(
          child: DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        Image.asset('assets/accountpic.jpeg').image,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Center(child: Text('User Name')),
                Center(child: Text('Expire Date')),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Color(0xffB4B4B4),
                  ),
                  title: Text('Home'),
                ),
                ListTile(
                  leading: Container(
                      height: 20,
                      width: 20,
                      child: Image.asset('assets/serviceIcon.jpeg')),
                  title: Text('Services'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Color(0xffB4B4B4),
                  ),
                  title: GestureDetector(
                      onTap: () {
                        moveToSetting();
                      },
                      child: Text('Settings')),
                ),
                ListTile(
                  leading: Icon(
                    Icons.mail,
                    color: Color(0xffB4B4B4),
                  ),
                  title: Text('Contact'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.info,
                    color: Color(0xffB4B4B4),
                  ),
                  title: Text('v20210601'),
                ),
                SizedBox(
                  height: 40,
                ),
                ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Color(0xffB4B4B4),
                  ),
                  title: Text('LogOut'),
                ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  height: 50,
                  width: 200,
                  color: Colors.pink,
                  child: Center(
                    child: Text(
                      'Mix Service',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage(
              'assets/background.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 35.0, sigmaY: 35.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, right: 15.0, left: 15.0, bottom: 130),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          _drawerkey.currentState!.openDrawer();
                        },
                        icon: Icon(Icons.menu, color: Colors.white)),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        'assets/connectasset.png',
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 50,
                  ),
                  // CountryListPick(
                  //     appBar: AppBar(
                  //       backgroundColor: Colors.white,
                  //       elevation: 0.0,
                  //       title: Text(''),
                  //     ),
                  //
                  //     // if you need custome picker use this
                  //     // pickerBuilder: (context, CountryCode countryCode){
                  //     //   return Row(
                  //     //     children: [
                  //     //       Image.asset(
                  //     //         countryCode.flagUri,
                  //     //         package: 'country_list_pick',
                  //     //       ),
                  //     //       Text(countryCode.code),
                  //     //       Text(countryCode.dialCode),
                  //     //     ],
                  //     //   );
                  //     // },
                  //
                  //     // To disable option set to false
                  //     theme: CountryTheme(
                  //       isShowFlag: true,
                  //       isShowTitle: true,
                  //       isShowCode: false,
                  //       isDownIcon: false,
                  //       showEnglishName: false,
                  //     ),
                  //     // Set default value
                  //     initialSelection: '+62',
                  //     // or
                  //     // initialSelection: 'US'
                  //     onChanged: (CountryCode? code) {
                  //       print(code?.name);
                  //       print(code?.code);
                  //       print(code?.dialCode);
                  //       print(code?.flagUri);
                  //     },
                  //     // Whether to allow the widget to set a custom UI overlay
                  //     useUiOverlay: true,
                  //     // Whether the country list should be wrapped in a SafeArea
                  //     useSafeArea: false),
                  ElevatedButton(
                      onPressed: () {
                        //    setState(() {});
                        moveToSecondPage();
                      },
                      child: Container(
                        width: width / 3,
                        height: height * 0.04,
                        child: Text(_information),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    _serverProtocol,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Connecting(
                                      LocationName: _information,
                                    )));
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset('assets/connectbutton.png'),
                          Text(
                            'Connect',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                letterSpacing: 2),
                          ),
                        ],
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
