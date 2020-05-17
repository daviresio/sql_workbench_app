import 'package:dbclientapp/database/database.dart';
import 'package:dbclientapp/model/connection_model.dart';
import 'package:dbclientapp/model/delete_query_model.dart';
import 'package:dbclientapp/model/query_response_model.dart';
import 'package:dbclientapp/pages/connection_home/pages/query/query_repository.dart';
import 'package:dbclientapp/pages/connection_home/pages/query/widgets/view_row/view_row_store.dart';
import 'package:dbclientapp/util/string_util.dart';
import 'package:dbclientapp/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

Future<dynamic> showViewDialog({BuildContext context, Map<String, dynamic> item, List<TypesResponseQueryModel> types, int connectionId}) {

  ViewRowStore _controller = ViewRowStore(item, types);

  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[200],
        title: Text('View Row'),
        content: Container(
          width: 300.0,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Observer(
              builder: (_) {
                if(_controller.types == null) return Container();

                List<String> keys = _controller.types.map((e) => e.columnName).toList();
                Map<String, dynamic> values = _controller.items;
                return ListView.builder(
                  itemCount: types.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                          title: SizedBox(
                            height: 45.0,
                            child: Observer(
                              builder: (_) => GetInput(
                                enabled: _controller.editMode,
                                initialValue: StringUtil.extractMapFieldTostring(values, keys[index]),
                                onChanged: (value) => _controller.changeValue(keys[index], value),
                                labelText: keys[index],
                                  //FIXME pegar o datatype filtrando pela coluna do mesmo nome e nao pelo index, pois pode ocasionar bugs
                                  inputType: types[index].dataType,
                              ),
                            ),
                          ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(types[index].dataType, style: TextStyle(fontSize: 12.0),),
                        ),
                        trailing: IconButton(icon: Icon(Icons.content_copy), onPressed: () {
                            Clipboard.setData(ClipboardData(text: StringUtil.extractMapFieldTostring(values, keys[index])));
                          //TODO exibir flushbar apos o registro ser copiado
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
              bool result = await Dialogs.deleteDialog(context);
              if(result == null || !result) return;
              try {
              var conn =  await Database.instance.connectionDao.find(connectionId);
              var connection = ConnectionModel.fromTable(conn);
              DeleteQueryModel deleteQueryModel = DeleteQueryModel(data: item, types: types, connection: connection);
              await QueryRepository().deleteRecord(deleteQueryModel);
              Navigator.of(context).pop();
              //TODO pesquisar ultima query pesquisada apos deletar
              } catch(e) {
                print(e);
              }
            },
            child: Text('DELETE'),
          ),
          FlatButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: item.toString()));
              //TODO exibir flushbar apos o registro ser copiado
              //ShowFlushbar.copied(context);
            },
            child: Text('COPY'),
          ),
          Observer(
            builder: (_) => FlatButton(
              onPressed: () async {
                if(_controller.editMode) {
                  try {
                    var conn =  await Database.instance.connectionDao.find(connectionId);
                    var connection = ConnectionModel.fromTable(conn);
                    DeleteQueryModel deleteQueryModel = DeleteQueryModel(data: _controller.items, types: types, connection: connection);
                    await QueryRepository().updateRecord(deleteQueryModel);
                    //TODO pesquisar ultima query pesquisada apos atualizar
                    Navigator.of(context).pop(true);
                  } catch(e) {
                    print(e);
                  }
                } else {
                  _controller.setEditMode(true);
                }
              },
              child: Text(_controller.editMode ? 'SAVE' : 'EDIT'),
            ),
          ),
        ],
      ));
}
class GetInput extends StatelessWidget {

  final String inputType;
  final bool enabled;
  final dynamic initialValue;
  final Function onChanged;
  final String labelText;

  const GetInput({Key key, this.inputType, this.enabled, this.initialValue, this.onChanged, this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget inputWidget;

    switch(inputType) {
      case 'text':
      case 'varchar':
      inputWidget = TextFormField(
        enabled: enabled,
        initialValue: initialValue,
        onChanged: onChanged,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(
            labelText: labelText,
            contentPadding: EdgeInsets.only(left: 2.0, bottom: 0, top: 0, right: 2.0)
        ),
        style: TextStyle(fontSize: 14.0, color: (enabled ? Colors.black : Colors.black54)),
      );
      break;
      case 'int':
        inputWidget = TextFormField(
          enabled: enabled,
          initialValue: initialValue,
          onChanged: onChanged,
          decoration: InputDecoration(
            labelText: labelText,
            contentPadding: EdgeInsets.only(left: 2.0, bottom: 0, top: 0, right: 2.0),
          ),
          style: TextStyle(fontSize: 14.0, color: (enabled ? Colors.black : Colors.black54)),
          inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.number,
        );
        break;
      case 'numeric':
        inputWidget = TextFormField(
          enabled: enabled,
          initialValue: initialValue,
          onChanged: onChanged,
          decoration: InputDecoration(
            labelText: labelText,
            contentPadding: EdgeInsets.only(left: 2.0, bottom: 0, top: 0, right: 2.0),
          ),
          style: TextStyle(fontSize: 14.0, color: (enabled ? Colors.black : Colors.black54)),
        );
        break;
      default:
        inputWidget = Container();
        break;
    }

    return inputWidget;
  }
}


