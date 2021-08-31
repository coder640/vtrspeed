import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vtrspeed/connectionScreens/connect.dart';
import 'package:vtrspeed/screens/settings.dart';

class DrwerWidget extends StatelessWidget {
  const DrwerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: Image.asset('assets/accountpic.jpeg').image,
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
            title: GestureDetector(onTap: () {}, child: Text('Settings')),
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
    );
  }
}
