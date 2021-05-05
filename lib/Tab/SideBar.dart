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
                decoration: BoxDecoration(color: Colors.black26),
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
                          image: AssetImage('assets/images/1.png'),
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
                title: Text('Candi Keagamaan'),

                onTap: () => Navigator.pushNamed(
                  context,
                  'CandiKeagamaan',
                ),
              ),
              ListTile(
                title: Text('Candi Non Keagamaan'),

                onTap: () => Navigator.pushNamed(
                  context,
                  'CandiNonKeagamaan',
                ),
              ),
              ListTile(
                title: Text('Candi Kerajaan'),

                onTap: () => Navigator.pushNamed(
                  context,
                  'CandiKerajaan',
                ),
              ),
              ListTile(
                title: Text('Candi Pribadi'),

                onTap: () => Navigator.pushNamed(
                  context,
                  'CandiPribadi',
                ),
              ),
              ListTile(
                title: Text('Candi Wanua'),

                onTap: () => Navigator.pushNamed(
                  context,
                  'CandiWanua',
                ),
              ),
              ListTile(
                title: Text('Candi Daerah'),

                onTap: () => Navigator.pushNamed(
                  context,
                  'CandiDaerah',
                ),
              ),
              ListTile(
                title: Text('About Us'),

                onTap: () => Navigator.pushNamed(
                  context,
                  'About',
                ),
              ),
              ListTile(
                title: Text('TES Us'),

                onTap: () => Navigator.pushNamed(
                  context,
                  'HalamanUtama',
                ),
              ),
              ListTile(
                title: Text('TES '),

                onTap: () => Navigator.pushNamed(
                  context,
                  'UserViewModel',
                ),
              ),


            ],
          ),
        ),
      ),
      );
  }
}