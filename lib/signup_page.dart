import 'package:flutter/material.dart';
class SignUPPage extends StatefulWidget {
  const SignUPPage({Key? key}) : super(key: key);

  @override
  State<SignUPPage> createState() => _SignUPPageState();
}

class _SignUPPageState extends State<SignUPPage> {
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
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                ),
              ),
            ),

          ),
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
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
        ],
      ),
    );
  }
}
