import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DemoBottomAppBar extends StatelessWidget {
  const DemoBottomAppBar({
    this.fabLocation = FloatingActionButtonLocation.endDocked,
    this.shape = const CircularNotchedRectangle(),
  });

  final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;

  static final List<FloatingActionButtonLocation> centerLocations =
  <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      color: Colors.black,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Container(
          height: 62,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                IconButton(
                  tooltip: 'Home',
                  icon: const Icon(Icons.home, size: 30,),
                  onPressed: () {},
                ),
                  Text('Home', style: TextStyle(color: Colors.white, fontSize: 10),),
          ]
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      tooltip: 'Notifications',
                      icon: const Icon(Icons.message_outlined, size: 30,),
                      onPressed: () {},
                    ),
                    Text('Notifications', style: TextStyle(color: Colors.white, fontSize: 10),),
                  ]
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      tooltip: 'Wishlist',
                      icon: const Icon(Icons.favorite_border, size: 30,),
                      onPressed: () {},
                    ),
                    Text('Wishlist', style: TextStyle(color: Colors.white, fontSize: 10),),
                  ]
              ),
              if (centerLocations.contains(fabLocation)) const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
