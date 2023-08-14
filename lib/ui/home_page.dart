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
         ListTile(
           title: Text("Hot Sales", style: TextStyle(color: Color(0xff343333), fontWeight: FontWeight.w700, fontSize: 12.0),),
           trailing: Text("See all", style: TextStyle(color: Color(0xff2794F9), fontWeight: FontWeight.w500, fontSize: 10.0),),
         ),
          SizedBox(height: 10,),
          GridView.builder(
          physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              crossAxisSpacing: 10.0, // Spacing between columns
              mainAxisSpacing: 10.0, // Spacing between rows
            ),
            itemCount: 2, // Number of grid items
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 310,
                width: 166,
                color: Color(0xffFFFFFF),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Padding(
                     padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
                     child: Container(
                       height: 140.0,
                       color: Color(0xffF5FAFF),
                       child: Center(
                         child: Image.asset("assets/images/headset.png"),
                       ),
                     ),
                   ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text("Airpods Max", style: TextStyle(
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
                          Text("N299.99", style: TextStyle(
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
          )

        ],
      ),
    );
  }
}
