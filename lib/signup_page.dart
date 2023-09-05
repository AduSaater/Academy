import 'dart:convert';
import 'package:academy/login_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
class SignUPPage extends StatefulWidget {
  const SignUPPage({Key? key}) : super(key: key);

  @override
  State<SignUPPage> createState() => _SignUPPageState();
}

class _SignUPPageState extends State<SignUPPage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscureText = true;
  //API Call
  Future<void> registerUser() async {
    final url = Uri.parse('https://saat-auth.onrender.com/api/users');
    final response = await http.post(
      url,
      body: jsonEncode({
        "firstName": firstNameController.text,
        "lastName": lastNameController.text,
        "email": emailController.text,
        "phone": phoneController.text,
        "password": passwordController.text,
      }),
      headers: {
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      // You can navigate to another screen or perform any other action here
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>HomePage()));
      print("User registered successfully!");

    } else {
      // User registration failed
      print("User registration failed. Error: ${response.body}");
      // Handle the registration failure here, e.g., show an error message.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Registration page", style: TextStyle(color: Colors.white, fontSize: 16),),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller: firstNameController,
              decoration: InputDecoration(
                labelText: "Firstname",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                ),
              ),
            ),

          ),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: TextFormField(
              controller: lastNameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Lastname",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                ),
              ),
            ),

          ),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Phone",
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(
                ),
              ),
            ),

          ),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: TextFormField(
              controller: passwordController,
              obscureText: obscureText,
              decoration: InputDecoration(
                labelText: "Password",
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: obscureText ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                  onPressed: (){
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                ),
                border: OutlineInputBorder(
                ),
              ),
            ),
          ),
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: GestureDetector(
              onTap: () async {
                registerUser();
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.orange,
                ),
                child: Center(child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 16),)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
