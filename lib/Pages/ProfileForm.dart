import 'package:flutter/material.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  List<String> _locations = [
    'Hinduism',
    'Islam',
    'Christianity',
    'Sikhism',
    'Buddhism',
    'Other'
  ]; // Option 2
  String? _selectedLocation; // Option 2
  List<String> _caste = ['Sc', 'St', 'Obc', 'General']; // Option 2
  String? _selectedCaste; // Option 2

  final dateController = TextEditingController();
  List gender = ["Male", "Female", "Other"];
  List marital = ["Single", "Devorced", "Widowed"];
  String? select;
  String? select1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text("Profile Page"),
        ),
        body: Container(
          child: ListView(children: [
            Column(
              children: [
                SizedBox(height: 10),
                Center(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                    radius: 60,
                  ),
                ),
                SizedBox(height: 5),
                Text("Aditya M. Khachar",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic)),
                SizedBox(height: 15),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 60,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Occupation',
                      ),
                    )),
                SizedBox(height: 15),
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width / 4),
                    addRadioButton(0, "Male"),
                    addRadioButton(1, "Female")
                  ],
                ),
                SizedBox(height: 5),
                Center(
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: TextField(
                          readOnly: true,
                          controller: dateController,
                          decoration: const InputDecoration(
                              hintText: 'Pick your Date',
                              prefixIcon: Icon(Icons.date_range)),
                          onTap: () async {
                            var date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100));
                            if (date != null) {
                              dateController.text =
                                  "${date.month}/${date.day}/${date.year}";
                            }
                          },
                        ))),
                SizedBox(height: 15),
                Center(
                    child: Row(
                  children: [
                    SizedBox(width: 3),
                    DropdownButton(
                      hint: Text(
                          'Please choose a Caste'), // Not necessary for Option 1
                      value: _selectedCaste,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedCaste = newValue;
                        });
                      },
                      items: _caste.map((caste) {
                        return DropdownMenuItem(
                          child: new Text(caste),
                          value: caste,
                        );
                      }).toList(),
                    ),
                    SizedBox(width: 10),
                    DropdownButton(
                      hint: Text(
                          'Please choose a Religion'), // Not necessary for Option 1
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
                  ],
                )),
                Text("Marital status"),
                Row(
                  children: [
                    SizedBox(width: 40),
                    addMaritalRadioButton(0, "Single"),
                    addMaritalRadioButton(1, "Married"),
                    addMaritalRadioButton(2, "Divorced"),
                  ],
                ),
                SizedBox(height: 10),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone',
                      ),
                    )),
                SizedBox(height: 15),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    )),
                SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        //borderRadius: BorderRadius.zero, //Rectangular border
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Submit",
                        style: TextStyle(fontSize: 20, color: Colors.black)))
              ],
            ),
          ]),
        ));
  }

  addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Colors.green,
          value: gender[btnValue],
          groupValue: select,
          onChanged: (value) {
            setState(() {
              print(value);
              select = value;
            });
          },
        ),
        Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
      ],
    );
  }

  addMaritalRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Colors.green,
          value: marital[btnValue],
          groupValue: select1,
          onChanged: (value) {
            setState(() {
              print(value);
              select1 = value;
            });
          },
        ),
        Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
      ],
    );
  }
}
