import 'package:flutter/material.dart';

class ExpandedItem extends StatelessWidget {

  final String title;
  final int lenght;
  final String image;
  final Widget child;

  const ExpandedItem({Key key, this.title, this.lenght, this.image, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 12.0),
      child: Card(
        child: ExpansionTile(
          leading: Image.asset(image, height: 20.0,),
          title: Text(title),
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
