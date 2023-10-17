
import 'package:flutter/material.dart';
import 'DataModel.dart';
import 'Page2.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String selectedGender = "";

  void _handleRadioValueChange(String value) {
    setState(() {
      selectedGender = value;
    });
  }

  String gender = "male";
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  void _submitForm() {
    // Create a DataModel instance
    final data = DataModel(
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      selectedGender: selectedGender,
    );

    // Navigate to Page2 and pass the data
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Page2(data: data),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Page 1')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name')),
              TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email')),
              TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password')),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Gender   :'),
                        Icon(Icons.man_3_outlined),
                        Text('Male'),
                        Radio(
                          value: "male",
                          onChanged: (value) {
                            setState(() {
                              gender = value!;
                              _handleRadioValueChange(value);
                            });
                          },
                          groupValue: gender,
                        ),
                        Icon(Icons.woman_outlined),
                        Text('Female'),
                        Radio(
                          value: "female",
                          onChanged: (value) {
                            setState(() {
                              gender = value!;

                              _handleRadioValueChange(value);
                            });
                          },
                          groupValue: gender,
                        ),
                      ],
                    ),
                    ElevatedButton(
                        onPressed: _submitForm, child: Text('Submit')),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
      