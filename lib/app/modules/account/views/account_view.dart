import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sahabatmt/app/constants/constants.dart';
import 'package:sahabatmt/app/modules/bottom_nav_bar/views/bottom_nav_bar_view.dart';
import 'package:sahabatmt/app/modules/widgets/appbarviews.dart';

import '../controllers/account_controller.dart';

import 'package:flutter/material.dart';

class AccountView extends GetView<AccountController> {
  final AccountController _profileController = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor1,
        iconTheme: IconThemeData(color: kPrimaryTextColor),
        title: appbarviews(title: "Account"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.0),
              Center(
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(
                      'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50'),
                ),
              ),
              SizedBox(height: 16.0),
              Center(
                child: Text(
                  'Personal Information',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8.0),
              Card(
                child: Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        Text(controller.name.toString()),
                        SizedBox(height: 16.0),
                        Text(
                          'Email ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        Text(controller.email.toString()),
                        SizedBox(height: 16.0),
                        Text(
                          'Phone ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        Text(controller.phone.toString()),
                        SizedBox(height: 16.0),
                        Text(
                          'Address',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        Text(controller.address.value),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Settings',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              ListTile(
                title: Text('Edit Profile'),
                leading: Icon(Icons.person),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.dialog(EditProfileDialog(controller));
                  // Navigate to profile editing page
                },
              ),
              ListTile(
                title: Text('Change Password'),
                leading: Icon(Icons.lock),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to password changing page
                },
              ),
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  // Logout user
                },
                child: Text(
                  'LOG OUT',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBarView(),
    );
  }
}

class EditProfileDialog extends StatelessWidget {
  final AccountController controller;

  EditProfileDialog(this.controller);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Set the initial values for the text fields to the current user values
    nameController.text = controller.name.value;
    emailController.text = controller.email.value;
    phoneController.text = controller.phone.value;
    addressController.text = controller.address.value;

    return AlertDialog(
      title: Text('Edit Profile'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text('CANCEL'),
        ),
        TextButton(
          onPressed: () {
            // Update the user's profile with the new values
            controller.updateProfile(
              nameController.text,
              emailController.text,
              phoneController.text,
              addressController.text,
            );
            Get.back();
          },
          child: Text('SAVE'),
        ),
      ],
    );
  }
}
