import 'package:academy/signup_page.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool obscureText = true;
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