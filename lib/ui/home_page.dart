import 'package:flutter/material.dart';
class UIHomePage extends StatefulWidget {
  const UIHomePage({Key? key}) : super(key: key);

  @override
  State<UIHomePage> createState() => _UIHomePageState();
}

class _UIHomePageState extends State<UIHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff131312),
        title: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo.png"),

              ],
            ),
          ),

        ),
        actions: [
          Image.asset("assets/images/cart.png"),
        ],
      ),
      drawer: Drawer(),
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
            child: Center(
              child: Padding(
                padding:  EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Ib’s Logics", style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffFFFFFF),
                      ),),
                      Text("Find all the phone accessories you need\nfor the New Year!", style: TextStyle(
                       fontWeight: FontWeight.w300, fontSize: 12.0, color: Color(0xffFFFFFF),
                      ),),
                    ],
                  ),
                  SizedBox(width: 10,),
                    Image.asset("assets/images/phone.png")
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
