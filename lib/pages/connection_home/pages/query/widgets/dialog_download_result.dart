import 'package:flutter/material.dart';

Future<dynamic> showDialogDownloadResultQuery(BuildContext context) {
  return showDialog(context: context, builder: (context) => AlertDialog(
    title: Text('Export'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('Format'),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[

          ],
        ),
        Text('Share as'),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[

          ],
        ),
      ],
    ),
  ));
}

class ItemOpcaoDownloadResultWidget extends StatelessWidget {

  final String image;
  final String title;
  final bool selected;

  const ItemOpcaoDownloadResultWidget({Key key, this.image, this.title, this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset('assets/images/$image', width: 48,),
          Text(title)
        ],
      ),
    );
  }
}
