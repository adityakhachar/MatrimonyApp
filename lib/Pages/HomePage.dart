import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:matrimony_app/Pages/ProfileForm.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _locations = [
    'Hinduism',
    'Islam',
    'Christianity',
    'Sikhism',
    'Buddhism',
    'Other'
  ]; // Option 2
  String? _selectedLocation; // Opti
  List<String> _LookingFor = ['Doctor', 'Engineer', 'House Wife', 'Other'];
  String? _SelectLooking;

  List<String> _MoterTongue = [
    "Hindi",
    "Gujarati",
    "Marathi",
    "Punjabi",
    "English",
    "Other"
  ];

  String? _selectToungue;
  String? _selectedLooking;
  String? _selectedTounge; // Option 2
  List mother_tounge = [
    "Hindi",
    "Gujarati",
    "Marathi",
    "Punjabi",
    "English",
    "Other"
  ];

  String? select;
  String? select1;
  String item1 = "Complete Profile";
  String item2 = "Log out";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Matromony APP"),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu_rounded)),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              String selectedval = value;
              setState(() {
                if (selectedval == item1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileForm(),
                      ));
                } else {
                  FirebaseAuth.instance.signOut();
                }
              });
            },
            itemBuilder: (context) => [
              PopupMenuItem(value: item1, child: Text("Complete Profile")),
              PopupMenuItem(value: item2, child: Text("Logout"))
            ],
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                    child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  // color: Colors.yellow,
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 3,
                        color: Colors.lightBlue,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Find Your",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              Text(
                                "Consultation ?",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(height: 20),
                              Row(children: [
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    decoration:
                                        BoxDecoration(color: Colors.white),
                                    child: DropdownButton(
                                      hint: Text("I'm Looking For",
                                          style: TextStyle(
                                              fontWeight: FontWeight
                                                  .bold)), // Not necessary for Option 1
                                      value: _selectedLooking,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedLooking = newValue as String;
                                        });
                                      },
                                      items: _LookingFor.map((look) {
                                        return DropdownMenuItem(
                                          child: new Text(look),
                                          value: look,
                                        );
                                      }).toList(),
                                    )),
                                SizedBox(width: 35),
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    decoration:
                                        BoxDecoration(color: Colors.white),
                                    child: DropdownButton(
                                      hint: Text("Mother toungue",
                                          style: TextStyle(
                                              fontWeight: FontWeight
                                                  .bold)), // Not necessary for Option 1
                                      value: _selectToungue,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectToungue = newValue as String;
                                        });
                                      },
                                      items: _MoterTongue.map((toungue) {
                                        return DropdownMenuItem(
                                          child: new Text(toungue),
                                          value: toungue,
                                        );
                                      }).toList(),
                                    )),
                              ]),
                              SizedBox(height: 30),
                              Container(
                                width: MediaQuery.of(context).size.width / 1,
                                decoration: BoxDecoration(color: Colors.white),
                                child: DropdownButton(
                                  hint: Text('Please choose a Religion',
                                      style: TextStyle(
                                          fontWeight: FontWeight
                                              .bold)), // Not necessary for Option 1
                                  value: _selectedLocation,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selectedLocation = newValue;
                                    });
                                  },
                                  items: _locations.map((location) {
                                    return DropdownMenuItem(
                                      child: new Text(location),
                                      value: location,
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              // color: Colors.blue,
              child: Column(children: [
                SizedBox(
                  height: 45,
                  width: MediaQuery.of(context).size.width / 1,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          //borderRadius: BorderRadius.zero, //Rectangular border
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Search",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "For You",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      width: 250,
                    ),
                    Text(
                      "Viewall",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  height: 200,
                  child: Stack(
                    children: [
                      Positioned(
                          child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("lib/Assets/Homepage2.png")),
                        ),
                      )),
                      const Positioned(
                          bottom: 0,
                          right: 50,
                          child: Column(
                            children: [
                              Text(
                                "Name: Natialiya Grone",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_city,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "India, Delhi     Charted Accountant",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )
                                ],
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.lightBlue,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
              padding: EdgeInsets.all(10.0),
              backgroundColor: Colors.lightBlue,
              tabBackgroundColor: Colors.orangeAccent,
              gap: 8,
              tabs: [
                GButton(icon: Icons.home, text: "Home"),
                GButton(icon: Icons.favorite_border, text: "Likes"),
                GButton(icon: Icons.search, text: "Search"),
                GButton(icon: Icons.settings, text: "Settings"),
              ]),
        ),
      ),
    );
  }
}
