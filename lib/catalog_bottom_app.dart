import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CatalogBottomBar extends StatefulWidget{
 @override
      _CatalogBottomBarState createState() => _CatalogBottomBarState();
}

class _CatalogBottomBarState extends State<CatalogBottomBar>{
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Colors.black,
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
          child: Row(
            children: <Widget>[
              InkWell(
                child: Container(
                  padding: EdgeInsets.all(5),
                  height: 35,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.credit_card_rounded),
                      Text('Check Out'),
                    ],
                  ),
                ),
              ),
              Spacer(),
              InkWell(
                child: Container(
                  padding: EdgeInsets.all(5),
                  height: 35,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.message_outlined),
                      Text('Chat Seller'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}