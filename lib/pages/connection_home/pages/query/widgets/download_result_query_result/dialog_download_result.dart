import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:csv/csv.dart';
import 'package:dbclientapp/config/local_notification_config.dart';
import 'package:dbclientapp/config/path_provider_config.dart';
import 'package:dbclientapp/pages/connection_home/pages/query/widgets/download_result_query_result/download_result_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';

Future<dynamic> showDialogDownloadResultQuery(
    BuildContext context, List<dynamic> values) {

  DownloadResultStore _controller = DownloadResultStore();

  String _parseCsv() {
    List<List<String>> csvStringList = List();
    csvStringList.add(Map<String, dynamic>.from(values[0]).keys.toList());

    values.forEach((v) {
      List<String> valuesToCsv = List();
      var row = Map<String, dynamic>.from(v);
      print(csvStringList[0].length);
      csvStringList[0].forEach((key) {
        valuesToCsv.add(row[key].toString());
      });
      csvStringList.add(valuesToCsv);
    });

    String csv = ListToCsvConverter().convert(csvStringList);

    return csv;
  }

  _salvarCsv() async {
    String filename = 'query_${DateTime.now().toString().replaceAll(':', '-')}.csv';
    await PathProviderConfig.writeStringFile(_parseCsv(), filename);
    await LocalNotificationConfig().showNotification(filename);
    Navigator.of(context).pop();
  }

  _salvarJson() async {
    String filename = 'query_${DateTime.now().toString().replaceAll(':', '-')}.json';
    await PathProviderConfig.writeStringFile(jsonEncode(values), filename);
    await LocalNotificationConfig().showNotification(filename);
    Navigator.of(context).pop();
  }

  _shareCsv() async {
    String filename = 'query_${DateTime.now().toString().replaceAll(':', '-')}.csv';
    File file = await PathProviderConfig.writeTempStringFile(_parseCsv(), filename);
    Uint8List bytes = await file.readAsBytes();
    await Share.file('Query result csv', filename, bytes, 'text/csv');
    Navigator.of(context).pop();
  }

  _shareJson() async {
    String filename = 'query_${DateTime.now().toString().replaceAll(':', '-')}.json';
    File file = await PathProviderConfig.writeTempStringFile(jsonEncode(values), filename);
    Uint8List bytes = await file.readAsBytes();
    await Share.file('Query result csv', filename, bytes, 'application/json');
    Navigator.of(context).pop();
  }

  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Format'),
                SizedBox(
                  height: 10.0,
                ),
                Observer(
                  builder: (_) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ItemOpcaoDownloadResultWidget(
                        image:
                            'assets/images/csv_${_controller.isCsvSelected ? 'active' : 'deactive'}.png',
                        onTap: () => _controller.setIsCsvSelected(true),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      ItemOpcaoDownloadResultWidget(
                        image:
                            'assets/images/json_${_controller.isCsvSelected ? 'deactive' : 'active'}.png',
                        onTap: () => _controller.setIsCsvSelected(false),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text('Share as'),
                SizedBox(
                  height: 10.0,
                ),
                Observer(
                  builder: (_) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ItemOpcaoDownloadResultWidget(
                        image:
                            'assets/images/download_${_controller.isDownloadSelected ? 'active' : 'deactive'}.png',
                        size: 36.0,
                        onTap: () => _controller.setIsDownloadSelected(true),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      ItemOpcaoDownloadResultWidget(
                        image:
                            'assets/images/share_${_controller.isDownloadSelected ? 'deactive' : 'active'}.png',
                        size: 36.0,
                        onTap: () => _controller.setIsDownloadSelected(false),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'CANCEL',
                  style: TextStyle(color: Colors.redAccent),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text(
                  'OK',
                ),
                onPressed: () {
                  if(_controller.isCsvSelected && _controller.isDownloadSelected) _salvarCsv();
                  if(!_controller.isCsvSelected && _controller.isDownloadSelected) _salvarJson();
                  if(_controller.isCsvSelected && !_controller.isDownloadSelected) _shareCsv();
                  if(!_controller.isCsvSelected && !_controller.isDownloadSelected) _shareJson();
                },
              ),
            ],
          )
  );
}

class ItemOpcaoDownloadResultWidget extends StatelessWidget {
  final String image;
  final Function onTap;
  final double size;

  const ItemOpcaoDownloadResultWidget(
      {Key key, this.image, this.onTap, this.size = 64.0})
      : super(key: key);

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
