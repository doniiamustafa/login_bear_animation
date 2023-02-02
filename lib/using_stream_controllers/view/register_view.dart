import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController userNameController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController password2Controller = TextEditingController();

  String dropdownvalue = 'ذكر';

  var items = ["ذكر", "أنثى"];

  bool _obscureText = true;
  bool _obscureText2 = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggle2() {
    setState(() {
      _obscureText2 = !_obscureText2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: const Text("تسجيل حساب"),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
                vertical: MediaQuery.of(context).size.height * 0.02),
            child: Card(
              color: Colors.white,
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 18.0, right: 18.0, top: 22.0, bottom: 20.0),
                child: Column(children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height / 15,
                      child: TextFormField(
                        controller: userNameController,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            label: const Text("الاسم"),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0))),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 24,
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height / 15,
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email_outlined),
                            label: const Text("البريد الالكتروني"),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0))),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 24,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 15,
                    child: TextFormField(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          prefixIcon: CountryCodePicker(
                            onChanged: (country) {},
                            initialSelection: '+20',
                            favorite: const ['+20', '+966', 'FR', '+966'],
                            showCountryOnly: false,
                            showOnlyCountryWhenClosed: true,
                            hideMainText: true,
                            dialogSize: Size(
                                MediaQuery.of(context).size.width * 0.9,
                                MediaQuery.of(context).size.height * 0.75),
                          ),
                          label: const Text("رقم الهاتف"),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0))),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 24,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 15,
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: _toggle,
                              icon: Icon(!_obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          prefixIcon: const Icon(Icons.lock_outline),
                          label: const Text("كلمه المرور"),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0))),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 24,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 15,
                    child: TextFormField(
                      controller: password2Controller,
                      obscureText: _obscureText2,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: _toggle2,
                              icon: Icon(!_obscureText2
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          prefixIcon: const Icon(Icons.lock_outline),
                          label: const Text("كلمه المرور"),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0))),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0, right: 8),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            "النوع",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ]),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.002),
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0, right: 8),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        value: dropdownvalue,
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(
                                items,
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                            log(dropdownvalue);
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 24,
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 18,
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 8),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(vertical: 0)),
                      child: const Text(
                        "تسجيل",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
