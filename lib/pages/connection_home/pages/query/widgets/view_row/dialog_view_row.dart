import 'package:dbclientapp/database/database.dart';
import 'package:dbclientapp/model/connection_model.dart';
import 'package:dbclientapp/model/delete_query_model.dart';
import 'package:dbclientapp/model/query_response_model.dart';
import 'package:dbclientapp/pages/connection_home/pages/query/query_repository.dart';
import 'package:dbclientapp/pages/connection_home/pages/query/widgets/view_row/view_row_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

Future<dynamic> showViewDialog({BuildContext context, Map<String, dynamic> item, List<TypesResponseQueryModel> types, int connectionId}) {
  print(item.runtimeType);
  print(item.toString());

  ViewRowStore _controller = ViewRowStore(item);

  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[200],
        title: Text('View Row'),
        content: Container(
          width: 300.0,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Observer(
              builder: (_)  {
                if(_controller.items == null) return Container();

                List<String> keys = _controller.items.keys.toList();
                List<dynamic> values = _controller.items.values.toList();
                return ListView.builder(
                  itemCount: keys.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                          title: SizedBox(
                            height: 45.0,
                            child: TextFormField(
                              enabled: _controller.editMode,
                              initialValue: values[index].toString(),
                              onChanged: (value) => _controller.changeValue(keys[index], value),
                              decoration: InputDecoration(
                                labelText: keys[index],
                                contentPadding: EdgeInsets.only(left: 2.0, bottom: 0, top: 0, right: 2.0)
                              ),
                              style: TextStyle(fontSize: 14.0, color: (_controller.editMode ? Colors.black : Colors.black54)),
                            ),
                          ),
                        subtitle: Text('varchar', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 10.0),),
                        trailing: IconButton(icon: Icon(Icons.content_copy), onPressed: () {
                            Clipboard.setData(ClipboardData(text: values[index].toString()));
                            //ShowFlushbar.copied(context);
                        }),
                      ),
                    );
                  },
                );
              }
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('CANCEL'),
          ),
          FlatButton(
            onPressed: () async {
              var conn =  await Database.instance.connectionDao.find(connectionId);
              var connection = ConnectionModel.fromTable(conn);
              DeleteQueryModel deleteQueryModel = DeleteQueryModel(data: item, types: types, connection: connection);
              await QueryRepository().deleteRecord(deleteQueryModel);
            },
            child: Text('DELETE'),
          ),
          FlatButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: item.toString()));
              //ShowFlushbar.copied(context);
            },
            child: Text('COPY'),
          ),
          FlatButton(
            onPressed: () {},
            child: Text('EDIT'),
          ),
        ],
      ));
}
