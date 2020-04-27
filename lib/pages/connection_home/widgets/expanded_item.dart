import 'package:flutter/material.dart';

class ExpandedItem extends StatelessWidget {

  final String title;
  final int lenght;
  final String image;
  final Widget child;
  final bool selected;

  const ExpandedItem({Key key, this.title, this.lenght, this.image, this.child, this.selected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 12.0),
      child: Card(
        child: ExpansionTile(
          backgroundColor: Colors.white,
          leading: Image.asset(image, height: 20.0,),
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
          children: <Widget>[
            Container(
              constraints: BoxConstraints(
                maxHeight: 225.0,
              ),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
