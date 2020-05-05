import 'package:dbclientapp/pages/connection_home/pages/query/widgets/download_result_query_result/download_result_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

Future<dynamic> showDialogDownloadResultQuery(BuildContext context) {

  DownloadResultStore _controller = DownloadResultStore();

  return showDialog(context: context, builder: (context) => AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Format'),
        SizedBox(height: 10.0,),
        Observer(
          builder: (_) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ItemOpcaoDownloadResultWidget(image: 'assets/images/csv_${_controller.isCsvSelected ? 'active' : 'deactive'}.png', onTap: () => _controller.setIsCsvSelected(true),),
              SizedBox(width: 30.0,),
              ItemOpcaoDownloadResultWidget(image: 'assets/images/json_${_controller.isCsvSelected ? 'deactive' : 'active'}.png', onTap: () => _controller.setIsCsvSelected(false),),
            ],
          ),
        ),
        SizedBox(height: 30.0,),
        Text('Share as'),
        SizedBox(height: 10.0,),
        Observer(
          builder: (_) => Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ItemOpcaoDownloadResultWidget(image: 'assets/images/download_active.png', size: 36.0, ),
              SizedBox(width: 30.0,),
              ItemOpcaoDownloadResultWidget(image: 'assets/images/share_active.png', size: 36.0, ),
            ],
          ),
        ),
      ],
    ),
  ));
}

class ItemOpcaoDownloadResultWidget extends StatelessWidget {

  final String image;
  final Function onTap;
  final double size;

  const ItemOpcaoDownloadResultWidget({Key key, this.image, this.onTap, this.size = 64.0}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Ink.image(
        image: AssetImage(image),
        child: InkWell(
          onTap: onTap,
        ),
      ),
    );
  }
}
