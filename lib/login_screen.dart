import 'dart:convert';
import 'package:academy/ui/home_page.dart';
import 'package:http/http.dart' as http;
import 'package:academy/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool obscureText = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> loginUser() async {
    final url = Uri.parse('https://saat-auth.onrender.com/api/login');
    final response = await http.post(
      url,
      body: jsonEncode({
        "email": emailController.text,
        "password": passwordController.text,
      }),
      headers: {
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      // User login successful
      final responseData = jsonDecode(response.body);
      final accessToken = responseData['token'];
      final user = responseData['user'];
      print("User logged in successfully!");
      print("Access Token: $accessToken");
      print("User Data: $user");

      // Store the access token and user data in SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('accessToken', accessToken);
      await prefs.setString('userData', jsonEncode(user));

      // Navigate to another screen or perform other actions here
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>UIHomePage()));
    } else {
      // User login failed
      print("User login failed. Error: ${response.body}");
      // Handle the login failure here, e.g., show an error message.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Login page", style: TextStyle(color: Colors.white, fontSize: 16),),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: TextFormField(
              controller: emailController,
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
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Forgot Password", style: TextStyle(color: Colors.orange, fontSize: 14),),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: GestureDetector(
              onTap: () {
                loginUser();
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.orange,
                ),
                child: Center(child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 16),)),
              ),
            ),
          ),
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have account?", style: TextStyle(color: Colors.grey, fontSize: 14),),
                  SizedBox(width: 5,),
                  GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUPPage()));
                      },
                      child: Text("Sign Up", style: TextStyle(color: Colors.black, fontSize: 14),)),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}