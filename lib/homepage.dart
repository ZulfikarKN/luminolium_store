import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_slider/carousel.dart';
import 'package:luminolium_store/bottom_app_bar.dart';
import 'package:luminolium_store/product.dart';
import 'package:luminolium_store/product_page.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.black,
        systemNavigationBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light));
    return Scaffold(
      body: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
          maxWidth: MediaQuery.of(context).size.width,
        ),
        color: Colors.black87,
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              maxWidth: MediaQuery.of(context).size.width,
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child:
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/decoration/Cover.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        ),
                      ),
                ),
                Expanded(
                  flex: 5,
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                              'Products',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 20
                        ),
                        Container(
                                height: 260,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final Product place = productList[index];
                                    return InkWell(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                                              return ProductScreen(place: place);
                                            }));
                                          },
                                      child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 7),
                                              child: Container(
                                                width: 160,
                                                height: 250,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                  borderRadius: BorderRadius.circular(25)
                                                ),
                                                child: Column(
                                                  children: <Widget>[
                                                    Expanded(
                                                        flex: 1,
                                                        child: Padding(
                                                          padding: EdgeInsets.only(top: 1.5),
                                                          child: Image.asset(
                                                            place.cover,
                                                            height: 180,
                                                          fit: BoxFit.cover,),
                                                        )),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                            horizontal: 5),
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
                                                          color: Colors.black,
                                                        ),
                                                        child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment
                                                                .start,
                                                            children: <Widget>[
                                                              SizedBox(height: 5,),
                                                              Text(place.name,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,),),
                                                              SizedBox(height: 5,),
                                                              Text(place.price,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .blue,
                                                                    fontWeight: FontWeight
                                                                        .bold,
                                                                    fontSize: 20),)
                                                            ]
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                    );
                                  },
                                  itemCount: productList.length,
                          ),
                        ),
                      ],
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: DemoBottomAppBar(),
    );
  }
}