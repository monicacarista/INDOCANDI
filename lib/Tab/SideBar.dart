import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        width: 80,
                        height: 80,
                        child: Image(
                          image: AssetImage('assets/images/temple.png'),
                        ),
                      ),
                      SizedBox(height: 1,),
                      Text(
                        'INDOCANDI',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              ListTile(
                title: Text('About Us'),

                onTap: () => Navigator.pushReplacementNamed(
                  context,
                  'About',
                ),
              ),
              ListTile(
                title: Text('Info'),

                onTap: () => Navigator.pushReplacementNamed(
                  context,
                  'Info',
                ),
              ),
              ListTile(
                title: Text('Map'),

                onTap: () => Navigator.pushReplacementNamed(
                  context,
                  'Map',
                ),
              ),
            ],
          ),
        ),
      ),
      );
  }
}