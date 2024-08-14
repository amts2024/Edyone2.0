import 'package:flutter/material.dart';

class Notify extends StatefulWidget {
  @override
  _NotifyState createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_sharp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20.0, 16, 20.0, 0.0),
        children: [
          ExpansionTile(
            title: Row(
              children: [
                Container(
                  width: 65,
                  height: 65,
                  child: Image.asset(
                    'icon/unsplash_D6.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit.',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 15.12 / 12,
                          color: Colors.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Text(
                        '1m ago',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          height: 15.12 / 12,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Est amet purus est sit risus, leo in aliquam. Duis semper amet, at integer. Nulla diam a, sagittis id eget sed malesuada tempus ligula.\n\nTortor integer lacus fames proin neque et consectetur. Vel ante gravida a sit suspendisse mauris risus. Gravida lorem mi tellus sodales facilisi amet, risus aliquet lectus. Elementum montes, cursus a tempus mattis ullamcorper malesuada. Scelerisque tellus aenean neque in volutpat. Sollicitudin aliquet scelerisque integer amet sapien imperdiet.',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13.64,
                    fontWeight: FontWeight.w400,
                    height: 19.09 / 13.64,
                    color: Color(0xFF70747E),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Row(
              children: [
                Container(
                  width: 65,
                  height: 65,
                  child: Image.asset(
                    'icon/unsplash_D6.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit.',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 15.12 / 12,
                          color: Colors.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Text(
                        '1m ago',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          height: 15.12 / 12,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Est amet purus est sit risus, leo in aliquam. Duis semper amet, at integer. Nulla diam a, sagittis id eget sed malesuada tempus ligula.\n\nTortor integer lacus fames proin neque et consectetur. Vel ante gravida a sit suspendisse mauris risus. Gravida lorem mi tellus sodales facilisi amet, risus aliquet lectus. Elementum montes, cursus a tempus mattis ullamcorper malesuada. Scelerisque tellus aenean neque in volutpat. Sollicitudin aliquet scelerisque integer amet sapien imperdiet.',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13.64,
                    fontWeight: FontWeight.w400,
                    height: 19.09 / 13.64,
                    color: Color(0xFF70747E),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
