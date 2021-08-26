import 'dart:ui';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:country_list_pick/country_selection_theme.dart';
import 'package:country_list_pick/support/code_country.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vtrspeed/connectionScreens/connecting.dart';
import 'package:vtrspeed/customWidget/drawerWidget.dart';

class Connect extends StatefulWidget {
  const Connect({Key? key}) : super(key: key);

  @override
  _ConnectState createState() => _ConnectState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _ConnectState extends State<Connect> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Container(
        width: width - 60,
        child: Drawer(
          child: DrwerWidget(),
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
                          _scaffoldKey.currentState!.openDrawer();
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
                  CountryListPick(
                      appBar: AppBar(
                        backgroundColor: Colors.white,
                        elevation: 0.0,
                        title: Text(''),
                      ),

                      // if you need custome picker use this
                      // pickerBuilder: (context, CountryCode countryCode){
                      //   return Row(
                      //     children: [
                      //       Image.asset(
                      //         countryCode.flagUri,
                      //         package: 'country_list_pick',
                      //       ),
                      //       Text(countryCode.code),
                      //       Text(countryCode.dialCode),
                      //     ],
                      //   );
                      // },

                      // To disable option set to false
                      theme: CountryTheme(
                        isShowFlag: true,
                        isShowTitle: true,
                        isShowCode: false,
                        isDownIcon: false,
                        showEnglishName: false,
                      ),
                      // Set default value
                      initialSelection: '+62',
                      // or
                      // initialSelection: 'US'
                      onChanged: (CountryCode? code) {
                        print(code?.name);
                        print(code?.code);
                        print(code?.dialCode);
                        print(code?.flagUri);
                      },
                      // Whether to allow the widget to set a custom UI overlay
                      useUiOverlay: true,
                      // Whether the country list should be wrapped in a SafeArea
                      useSafeArea: false),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => ChooseLocation()));
                  //     },
                  //     child: Text('')),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'AnyConnect',
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
                                builder: (context) => Connecting()));
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
