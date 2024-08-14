import 'package:flutter/material.dart';

class Notify extends StatefulWidget {
  @override
  _NotifyState createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 16, 20.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_sharp),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Notifications',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color(0xFF0B121F),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    // First Row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start, // Align items to the start of the row
                      children: [
                        Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 2.0, color: Colors.transparent),
                            ),
                          ),
                          child: Image.asset(
                            'icon/unsplash_D6.png', // Replace with your image URL or asset
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
                                  fontFamily: 'Outfit',
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
                                  fontFamily: 'Outfit',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  height: 15.12 / 12,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 19,
                          height: 19,
                          decoration: BoxDecoration(
                            color: Color(0xFF58ECB7),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: SizedBox(),
                        ),
                      ],
                    ),
                    SizedBox(height: 16), // Spacing between rows

                    // Second Row (duplicate of the first row)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 2.0, color: Colors.transparent),
                            ),
                          ),
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
                                  fontFamily: 'Outfit',
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
                                  fontFamily: 'Outfit',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  height: 15.12 / 12,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 19,
                          height: 19,
                          decoration: BoxDecoration(
                            color: Color(0xFF58ECB7),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: SizedBox(),
                        ),
                      ],
                    ),

                    SizedBox(height: 16), // Spacing between rows

                    // Second Row (duplicate of the first row)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 2.0, color: Colors.transparent),
                            ),
                          ),
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
                                  fontFamily: 'Outfit',
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
                                  fontFamily: 'Outfit',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  height: 15.12 / 12,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 19,
                          height: 19,
                          decoration: BoxDecoration(
                            color: Color(0xFF58ECB7),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: SizedBox(),
                        ),
                      ],
                    ),

                    SizedBox(height: 16), // Spacing between rows

                    // Second Row (duplicate of the first row)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 2.0, color: Colors.transparent),
                            ),
                          ),
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
                                  fontFamily: 'Outfit',
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
                                  fontFamily: 'Outfit',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  height: 15.12 / 12,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 19,
                          height: 19,
                          decoration: BoxDecoration(
                            color: Color(0xFF58ECB7),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: SizedBox(),
                        ),
                      ],
                    ),

                    SizedBox(height: 16), // Spacing between rows

                    // Second Row (duplicate of the first row)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 2.0, color: Colors.transparent),
                            ),
                          ),
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
                                  fontFamily: 'Outfit',
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
                                  fontFamily: 'Outfit',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  height: 15.12 / 12,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 19,
                          height: 19,
                          decoration: BoxDecoration(
                            color: Color(0xFF58ECB7),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: SizedBox(),
                        ),
                      ],
                    ),


                    // Add more rows here by duplicating the structure
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
