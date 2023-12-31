import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class UIHomePage extends StatefulWidget {
  const UIHomePage({Key? key}) : super(key: key);
  @override
  State<UIHomePage> createState() => _UIHomePageState();
}

class _UIHomePageState extends State<UIHomePage> {
  List<ItemModel> items = [
    ItemModel(name: "Airpods Max", image: "assets/images/headset.png", price: 200),
    ItemModel(name: "HP ProBook 4544", image: "assets/images/laptop.png", price: 500),
    ItemModel(name: "MacBook Pro 14", image: "assets/images/headset.png", price: 700),
    ItemModel(name: "Apple iPad Pro", image: "assets/images/headset.png", price: 800),

  ];
  Map<String, dynamic>? userData;

  Future<void> getUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');

    if (accessToken != null) {
      final url = Uri.parse('https://saat-auth.onrender.com/api/users/me');
      final response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer $accessToken",
        },
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final user = responseData['user'];
        setState(() {
          userData = user;
        });
      } else {
        // Handle the error if the request fails
        print("Failed to fetch user profile. Error: ${response.body}");
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff131312),
        title: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child:
                Image.asset("assets/images/logo.png"),

          ),

        ),
        actions: [
          Image.asset("assets/images/cart.png"),
        ],
      ),
      drawer: Drawer(
       child: Center(
          child: userData != null
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('First Name: ${userData!['firstName']}'),
              Text('Last Name: ${userData!['lastName']}'),
              Text('Email: ${userData!['email']}'),
              Text('Phone: ${userData!['phone']}'),
            ],
          )
              : CircularProgressIndicator(),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        children: [
          Container(
            height: 142,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xff843667)
            ),
            child:  Padding(
                padding:  EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Text("Ib’s Logics", style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffFFFFFF),
                      ),),
                      SizedBox(height: 5,),
                      Text("Find all the phone accessories you need\nfor the New Year!", style: TextStyle(
                       fontWeight: FontWeight.w300, fontSize: 12.0, color: Color(0xffFFFFFF),
                      ),),
                      SizedBox(height: 5,),
                      Text("All at special discounts!", style: TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 9.0, color: Color(0xffFFE0C7),
                      ),),
                    ],
                  ),
                  SizedBox(width: 10,),
                    Image.asset("assets/images/phone.png")
                  ],
                ),
              ),

          ),
          SizedBox(height: 10,),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  height: 28.0,
                   width: 68.0,
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(17.0),
                  ),
                  child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/iphone.png"),
                        SizedBox(width: 5,),
                        Text("All", style: TextStyle(fontSize: 10.0, color: Color(0xff8B8B8B), fontWeight: FontWeight.w400),)
                      ],
                    ),
                  ),
                SizedBox(width: 10,),
                //************************ Computer*****************
                Container(
                   height: 28.0,
                  width: 96.0,
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(17.0),
                  ),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/iphone.png"),
                      SizedBox(width: 5,),
                      Text("Computers", style: TextStyle(fontSize: 10.0, color: Color(0xff8B8B8B), fontWeight: FontWeight.w400),)
                    ],
                  ),
                ),
                SizedBox(width: 10,),
                //************************ Speakers*****************
                Container(
                  height: 28.0,
                  width: 96.0,
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(17.0),
                  ),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/iphone.png"),
                      SizedBox(width: 5,),
                      Text("Speakers", style: TextStyle(fontSize: 10.0, color: Color(0xff8B8B8B), fontWeight: FontWeight.w400),)
                    ],
                  ),
                ),
                SizedBox(width: 10,),
                //************************ Headset*****************
                Container(
                  height: 28.0,
                  width: 96.0,
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(17.0),
                  ),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/iphone.png"),
                      SizedBox(width: 5,),
                      Text("Headset", style: TextStyle(fontSize: 10.0, color: Color(0xff8B8B8B), fontWeight: FontWeight.w400),)
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
         Padding(
           padding: EdgeInsets.only(left: 4.0, right: 4.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
                Text("Hot Sales", style: TextStyle(color: Color(0xff343333), fontWeight: FontWeight.w700, fontSize: 12.0),),
               Text("See all", style: TextStyle(color: Color(0xff2794F9), fontWeight: FontWeight.w500, fontSize: 10.0),),
             ],
           ),
         ),
          SizedBox(height: 10,),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              crossAxisSpacing: 10.0, // Spacing between columns
              mainAxisSpacing: 20.0, // Spacing between rows
            ),
            itemCount: items.length, // Number of grid items
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 257,
                width: 166,
                color: Color(0xffFFFFFF),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Padding(
                     padding: EdgeInsets.only(top: 3.0, left: 3.0, right: 3.0),
                     child: Container(
                       height: 140.0,
                       color: Color(0xffF5FAFF),
                       child: Center(
                         child: Image.asset(items[index].image),
                       ),
                     ),
                   ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(items[index].name, style: TextStyle(
                        color: Color(0xff343333),
                        fontSize: 12.0,
                        fontWeight: FontWeight.w700,
                      ),),
                    ),
                    SizedBox(height: 5,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text("Winning Beat Sound", style: TextStyle(
                        color: Color(0xff9C9C9C),
                        fontSize: 9.0,
                        fontWeight: FontWeight.w400,
                      ),),
                    ),
                    SizedBox(height: 5,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(items[index].price.toString() , style: TextStyle(
                              color: Color(0xff343333),
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                            ),),
                           CircleAvatar(
                             backgroundColor: Colors.black,
                             radius: 15,
                             child: Center(
                               child: Icon(Icons.add, color: Color(0xffFFFFFF),),
                             ),
                           ),

                        ],
                      ),

                    ),
                  ],
                ),
              );
            },
          ),

        ],
      ),
    );
  }
}

class ItemModel {
  final String name;
  final String image;
  final int price;
  ItemModel({required this.name, required this.image, required this.price});
}

