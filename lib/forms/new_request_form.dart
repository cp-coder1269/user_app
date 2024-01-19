// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:user_app/color_file.dart';
import 'package:user_app/forms/error_page.dart';
import 'package:user_app/forms/new_request_confirm.dart';
import 'package:user_app/models/RequestData.dart';
import 'package:user_app/services/api_services.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  MyFormState createState() => MyFormState();
}

class MyFormState extends State<MyForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  String requestState = 'normal';

  // Focus nodes for each TextFormField
  FocusNode nameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode salaryFocus = FocusNode();

  @override
  void dispose() {
    // Dispose of the focus nodes to avoid memory leaks
    nameFocus.dispose();
    emailFocus.dispose();
    salaryFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Container(
          //margin: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: ColorSelect.primaryColor1,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _header(context),
                _inputField(context),
                const SizedBox(height: 20),
                _submitButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _header(context) {
    return const Column(
      children: [
        Text(
          "Salary Request",
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        Text("Please enter your details"),
      ],
    );
  }

  _inputField(context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      TextFormField(
        controller: nameController,
        focusNode: nameFocus,
        decoration: InputDecoration(
          hintText: "Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
          fillColor: Colors.purple.withOpacity(0.1),
          filled: true,
          prefixIcon: const Icon(Icons.person),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Name cannot be empty';
          }
          if (!RegExp("^[a-zA-Z ]+\$").hasMatch(value)) {
            return 'Numerics and special characters not allowed.';
          }
          return null;
        },
        onChanged: (value) {
          if (_formKey.currentState != null && nameFocus.hasFocus) {
            _formKey.currentState!.validate();
          }
        },
      ),
      const SizedBox(height: 10),
      TextFormField(
        controller: emailController,
        focusNode: emailFocus,
        decoration: InputDecoration(
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
          fillColor: Colors.purple.withOpacity(0.1),
          filled: true,
          prefixIcon: const Icon(Icons.email),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Email cannot be empty';
          }
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]\$")
              .hasMatch(value)) {
            return 'Please enter a valid email';
          }
          return null;
        },
        onChanged: (value) {
          if (_formKey.currentState != null && emailFocus.hasFocus) {
            _formKey.currentState!.validate();
          }
        },
      ),
      const SizedBox(height: 10),
      TextFormField(
        controller: salaryController,
        focusNode: salaryFocus,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: "Expected Salary",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
          fillColor: Colors.purple.withOpacity(0.1),
          filled: true,
          prefixIcon: const Icon(Icons.attach_money),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Expected Salary cannot be empty';
          }
          num? parsedNumber = num.tryParse(value);
          if (parsedNumber == null) {
            return 'Please enter a valid number';
          }
          return null;
        },
        onChanged: (value) {
          if (_formKey.currentState != null && salaryFocus.hasFocus) {
            _formKey.currentState!.validate();
          }
        },
      ),
    ]);
  }

  _submitButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          fixedSize: const Size(300, 60),
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Colors.purple,
        ),
        onPressed: requestState == 'normal'
            ? () async {
                if (_formKey.currentState != null &&
                    _formKey.currentState!.validate()) {
                  String name = nameController.text;
                  String email = emailController.text;
                  String salary = salaryController.text;

                  setState(() {
                    requestState = 'loading';
                  });
                  _formKey.currentState?.reset();

                  try {
                    RequestData requestData = (await ApiService()
                        .getRequestData(name, email, salary))!;
                    // Do something with the entered data, e.g., print to console
                    print(requestData.toJson().toString());
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RequestDetails(requestData: requestData),
                      ),
                    );
                  } catch (e) {
                    print('Some error occurred ${e.toString()}');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ErrorPage(errorMessage: e.toString()),
                      ),
                    );
                  } finally {
                    setState(() {
                      requestState = 'normal';
                    });
                  }
                } else {
                  setState(() {});
                }
              }
            : null,
        child: requestState == 'normal'
            ? const Text(
                'Submit',
                style: TextStyle(fontSize: 20, color: Colors.white),
              )
            : const Text(
                'Processing...',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
      ),
    );
  }
}
