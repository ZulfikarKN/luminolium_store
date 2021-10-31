
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_slider/carousel.dart';
import 'package:luminolium_store/catalog_bottom_app.dart';
import 'package:luminolium_store/product.dart';

class ProductScreen extends StatefulWidget {
  final Product place;

  ProductScreen({required this.place});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Color? _pickedColor;
  String? _pickedSize;
  bool _wishlist = false;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light, // not working
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light, // works
    ));
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text('Luminolium',
            style: TextStyle(
              color: Colors.white, fontFamily: 'LemonMilk'
            ),
          ),
          actions: <Widget>[
            Builder(builder: (context) {
              return IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
              );
            })
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add_shopping_cart),
          backgroundColor: Colors.black,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: CatalogBottomBar(),
        body: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              maxWidth: MediaQuery.of(context).size.width,
            ),
            decoration: BoxDecoration(
                color: Colors.black87
            ),
            child: ListView(
              children: <Widget>[
                Container(
                  height: 350,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white
                  ),
                  child: Carousel(
                    activateIndicatorColor: Colors.black87,
                    indicatorBarColor: Colors.transparent,
                    height: 330,
                    items: widget.place.imageAsset.map((url) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(url, fit: BoxFit.cover,),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                    Text( widget.place.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      ),),
                      Text( widget.place.price,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                      ),)
                    ]
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 50,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Size: ',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                  ),
                                  Row(
                                    children: widget.place.availableSize.map((url) {
                                        return InkWell(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: (_pickedSize != url) ? Text(url, style: TextStyle(fontWeight: FontWeight.w500),) :
                                            Text(url, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              (_pickedSize == url) ? _pickedSize = null : _pickedSize = url;
                                            });
                                          },
                                        );
                                      }).toList(),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 50,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Color: ', style: TextStyle(fontWeight: FontWeight.bold), ),
                                    Row(
                                      children: widget.place.colors.map((url) {
                                        Color? color;
                                        color = url;
                                        return InkWell(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: 17,
                                              width: 17,
                                              decoration: BoxDecoration(
                                                color: color,
                                                border: (_pickedColor != url) ?
                                                (url == Colors.white) ? Border.all(color: Colors.black26, width: 1) : Border.all(color: Colors.transparent) :
                                                Border.all(color: Colors.blue, width: 2),
                                              ),
                                            ),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              (_pickedColor == url) ? _pickedColor = null : _pickedColor = url;
                                            });
                                          },
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Color(0xffe8bbbb),
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon((_wishlist == true) ? Icons.favorite : Icons.favorite_border,
                            color: Color(0xFFC71709), size: 25),
                          onPressed: () {
                            setState(() {
                              _wishlist = !_wishlist;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 320,
                  padding: EdgeInsets.only(bottom: 40),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Descriptions', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('''- Chino pants in basic colors for easy style
- Regular fit
- Front button and zipper
- 2 front and back pockets
- Cotton spandex material is not transparent, lightweight and does not stretch
- Model's height is 187cm, waist circumference is 80cm, wearing size 32 in'''),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}