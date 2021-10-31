import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luminolium_store/data.dart';
import 'homepage.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  final User? user;
  MainScreen(this.user);
  @override
Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        centerTitle: true,
        backwardsCompatibility: false,
        backgroundColor: Colors.black,
        title: Text(
          'LUMINOLIUM',
          style: TextStyle(
            fontFamily: 'LemonMilk',
            fontWeight: FontWeight.w300,
            color: Colors.white),),
        leading: Builder(
          builder: (context){
            return IconButton(
              icon: Icon(Icons.menu_rounded, size: 25,),
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: <Widget>[
          Builder(
            builder: (context){
              return InkWell(
                child: CircleAvatar(
                  child: Image.network('https://robohash.org/zaburazuka'),
                  backgroundColor: Colors.white,
                    radius: 20.0,
                ),
                onTap: (){
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ],
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width*0.60,
        child: Drawer(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 5),
            height: double.infinity,
            color: Colors.black,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                Container(
                  height: 40,
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      fillColor: Colors.white24,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white,)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white,)
                      ),
                      prefixIcon: Icon(Icons.search_rounded, color: Colors.white),
                      hintText: 'search',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        height: 2.3,
                        fontSize: 20,
                      )
                    ),
                  ),
                ),
                SizedBox(height: 40),
                InkWell(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        height: 80,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.black54,
                              ],
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                          ),
                          image: DecorationImage(
                              image: AssetImage('images/decoration/t-shirt.jpeg'),
                          fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        height: 80,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black54,
                            ],
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          ' T-Shirts',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20.0),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 40,),
                InkWell(
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        height: 80,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/decoration/jacket.jpg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        height: 80,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black54,
                            ],
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          ' Jackets',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20.0),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 40,),
                InkWell(
                  child: Stack(
                    children: <Widget>[Container(
                      padding: EdgeInsets.only(left: 5),
                      height: 80,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/decoration/pants.jpg'),
                            fit: BoxFit.cover),
                      ),
                      alignment: Alignment.bottomLeft,
                    ),
                      Container(
                        height: 80,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black54,
                            ],
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          ' Pants',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20.0, backgroundColor: Colors.transparent),
                        ),
                      ),
                    ]
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      endDrawer: Drawer(
          child: Container(
            padding: EdgeInsets.zero,
            color: Colors.black,
            child: Column(
              children: <Widget>[
              Container(
                height: 135,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40.0,
                        backgroundImage: NetworkImage(user!.photoURL ?? ""),
                        backgroundColor: Colors.white,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(user!.displayName ?? "0",maxLines: 2, style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),),
                          Text(user!.email ?? "0", style: TextStyle(color: Colors.white, fontSize: 10.0),),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                children: <Widget>[
                  Divider(color: Colors.white, thickness: 1),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      child: Row(
                          children: <Widget>[
                            Icon(Icons.account_circle, color: Colors.white, size: 30,),
                            Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                            Text("Account", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                          ]),
                    ),
                  ),
                  Divider(color: Colors.white,thickness: 1),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      child: Row(
                          children: <Widget>[
                            Icon(Icons.shopping_cart, color: Colors.white, size: 30,),
                            Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                            Text("Cart", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                          ]),
                    ),
                  ),
                  Divider(color: Colors.white,thickness: 1),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      child: Row(
                          children: <Widget>[
                            Icon(Icons.settings, color: Colors.white, size: 30,),
                            Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                            Text("Settings", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                          ]),
                    ),
                  ),
                  Divider(color: Colors.white,thickness: 1),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      child: Row(
                          children: <Widget>[
                            Icon(Icons.help, color: Colors.white, size: 30,),
                            Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                            Text("Helps", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                          ]
                      ),
                    ),
                  ),
                  Divider(color: Colors.white, thickness: 1,),
                  Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Container(
                        width: 200,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )
                              )
                          ),
                          child: Text('Sign Out', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500)),
                          onPressed: () async {
                            await context.read<AuthenticationService>().signOut();
                          },
                        ),
                      ),
                    ),
                ),
                ],
              ),
              )
            ],
          ),
      ),
      ),
      body: Homepage(),
    );
  }
}