import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppTextInput/index.dart';
import 'package:jobfortech/constant/theme.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  _EditProfileViewState createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dropdown = TextEditingController();
  final TextEditingController _phonenumber = TextEditingController();
  final TextEditingController _birthdate = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _city = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Profile'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Account',
                  style: AppTitleHeader,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/727/727399.png'),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 12,
                          child: Icon(Icons.camera_alt,
                              size: 14, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 50,
                          width: 150,
                          child:
                              AppButton(text: 'Upload Photo', onPressed: () {}),
                        ),
                        Text(
                          'Ut porttitor vel convallis id\nneque molestie. Nunc odio\nfermentum dolor pharetra\neget.',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14), // contoh menyesuaikan ukuran font
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
                AppTextInput(
                    controller: _nameController,
                    labelText: 'Full Name',
                    hintText: ''),
                SizedBox(height: 20),
                AppTextInput(
                    readOnly: true,
                    controller: _dropdown,
                    labelText: 'Your Tech, Role',
                    hintText: '',
                    suffix: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        items: [
                          'Android Developer',
                          'UI/UX',
                          'Backend Developer',
                          'Frontend Developer',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        }).toList(),
                        onChanged: (newValue) {
                          _dropdown.text = newValue!;
                        },
                      ),
                    )),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Contact',
                  style: AppTitleHeader,
                ),
                AppTextInput(
                    readOnly: true,
                    controller: _phonenumber,
                    labelText: 'Phone Number',
                    hintText: '',
                    prefix: Text('+62')),
                SizedBox(
                  height: 20,
                ),
                AppTextInput(
                  controller: _emailController,
                  labelText: 'Email',
                  hintText: '',
                ),
                SizedBox(
                  height: 20,
                ),
                AppTextInput(
                    readOnly: true,
                    controller: _birthdate,
                    labelText: 'Birth Date',
                    hintText: '',
                    suffix: Icon(
                      Icons.calendar_today_outlined,
                      color: AppColor.blue,
                    )),
                SizedBox(
                  height: 20,
                ),
                AppTextInput(
                  controller: _address,
                  labelText: 'Address',
                  hintText: '',
                ),
                SizedBox(
                  height: 20,
                ),
                AppTextInput(
                    readOnly: true,
                    controller: _city,
                    labelText: 'City',
                    hintText: '',
                    suffix: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        items: [
                          'Indonesia',
                          'Amerika',
                          'Korea',
                          'China',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        }).toList(),
                        onChanged: (newValue) {
                          _city.text = newValue!;
                        },
                      ),
                    )),
                SizedBox(height: 50),
                Text(
                  'Link Account',
                  style: AppTitleHeader,
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      print('Name: ${_nameController.text}');
                      print('Email: ${_emailController.text}');
                    },
                    child: Text('Save Changes'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
