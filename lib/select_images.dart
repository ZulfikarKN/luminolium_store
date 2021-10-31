import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SelectGridPage extends StatefulWidget{
  @override
  _SelectGridPageState createState() => _SelectGridPageState();
}

class _SelectGridPageState extends State<SelectGridPage>{
  final urlImages = [
    'images/decoration/logo.png'
    'images/decoration/zaburazuka.png'
    'images/decoration/zaburazuka.png'
    'images/decoration/zaburazuka.png'
    'images/decoration/zaburazuka.png'
    'images/decoration/zaburazuka.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,),
          itemBuilder: (context,index) => SelectableItemWidget(
            url: urlImages[index],
          )),
    );
  }
}

class SelectableItemWidget extends StatefulWidget{
  final String url;

  const SelectableItemWidget({
    Key? key,
    required this.url,
}) : super(key: key);

  @override
  _SelectableItemWidgetState createState() => _SelectableItemWidgetState();
}

class _SelectableItemWidgetState extends State<SelectableItemWidget> {
  @override
  Widget build(BuildContext context) =>
      Image.asset(widget.url, fit: BoxFit.cover,);
}