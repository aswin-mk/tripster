import 'package:flutter/material.dart';
import 'package:tripster/services/adduser.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _phoneController = TextEditingController();
  String? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6FB9A9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.black,
                  child: Text(
                    'TR',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Enter Your Details',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 32.0),
                const Text(
                  'Hi, nice to see you again',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: 'Full name',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                TextField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Age',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Mobile Number',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const Text("Select Your Gender"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Radio<String>(
                      value: "male",
                      groupValue: gender,
                      onChanged: (value) => setState(() => gender = value),
                      activeColor: Colors.blue,
                    ),
                    const Text("Male"),
                    Radio<String>(
                      value: "female",
                      groupValue: gender,
                      onChanged: (value) => setState(() => gender = value),
                      activeColor: Colors.blue,
                    ),
                    const Text("Female"),
                    Radio<String>(
                      value: "other",
                      groupValue: gender,
                      onChanged: (value) => setState(() => gender = value),
                      activeColor: Colors.blue,
                    ),
                    const Text("Other"),
                  ],
                ),
                ElevatedButton(
                  onPressed: () async {
                    AddUser(
                        _nameController.text,
                        gender!,
                        int.parse(_ageController.text),
                        int.parse(_phoneController.text),
                        context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF5E9C9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text('Continue'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
