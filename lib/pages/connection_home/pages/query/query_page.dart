import 'package:dbclientapp/database/dao/query_saved_dao.dart';
import 'package:dbclientapp/database/database.dart';
import 'package:dbclientapp/model/connection_model.dart';
import 'package:dbclientapp/model/query_model.dart';
import 'package:dbclientapp/pages/connection_home/pages/query/query_store.dart';
import 'package:dbclientapp/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';

import 'widgets/download_result_query_result/dialog_download_result.dart';
import 'widgets/view_row/dialog_view_row.dart';

class QueryPage extends StatefulWidget {

  final int databaseInfoId;
  final int connectionId;
  final Function setQuerySaved;

  QueryPage({Key key, this.databaseInfoId, this.connectionId, this.setQuerySaved}) : super(key: key);

  TextEditingController queryEditingController = TextEditingController();

  @override
  _QueryPageState createState() => _QueryPageState();
}

class _QueryPageState extends State<QueryPage> {

  final GlobalKey<State> _globalKey = GlobalKey<State>();
  final QuerySavedDao _querySavedDao = Database.instance.querySavedDao;

  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollControllerListener);
    super.initState();

  }

  _scrollControllerListener() {
//    print(_scrollController.position);
  }

  @override
  Widget build(BuildContext context) {

    final QueryStore _controller = Provider.of<QueryStore>(context);

    _scrollToTop() {
      _scrollController.animateTo(0.0, duration: Duration(milliseconds: 500), curve: Curves.easeOut);
      _controller.setOnTop(true);
    }

    _scrollToBottom() {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 500), curve: Curves.easeOut);
      _controller.setOnTop(false);
    }

    _saveQuery(QuerySaved querySaved) async {
      if(querySaved.id != null && querySaved.id > 0) {
        var result = await _querySavedDao.edit(querySaved);
        _controller.setQuery(_controller.querySaved.copyWith(id: result, query: widget.queryEditingController.text));
      } else {
        var result = await _querySavedDao.add(querySaved);
      }
    }

    return Scaffold(
      floatingActionButton: Observer(
        //TODO exibir com base se a pesquisa foi feita e nao se tem linhas
        builder: (_) {
//          print(_controller.types.toString());
          return _controller.rows.length > 0 ? SpeedDial(
            animatedIcon: AnimatedIcons.menu_close,
            backgroundColor: Colors.blueAccent,
            children: [
              (_controller.isQueryInSingleTable ? SpeedDialChild(
                elevation: 8.0,
                backgroundColor: Colors.green,
                child: Icon(Icons.add),
                onTap: () {

                },
              ) : Container()),
              SpeedDialChild(
                elevation: 8.0,
                backgroundColor: Colors.cyan,
                child: Icon(Icons.file_download),
                onTap: () async {
                  await showDialogDownloadResultQuery(
                      context, _controller.rows);
                },
              ),
            ],
          ) : Container();

        },
      ),
      body: ListView(
        controller: _scrollController,
        shrinkWrap: true,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(16.0),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
                    child: TextFormField(
                      controller: widget.queryEditingController,
                      onChanged: _controller.setQuery,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        labelText: 'Query',
                        suffix: GestureDetector(
                          child: Icon(Icons.close),
                          onTap: () {
                            WidgetsBinding.instance.addPostFrameCallback((_) => widget.queryEditingController.clear());
                          },
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        child: Text('SAVE'),
                        onPressed: () {
                          _saveQuery(_controller.querySaved.copyWith(saved: true, databaseInfoId: widget.databaseInfoId, query: widget.queryEditingController.text));
                        },
                      ),
                      FlatButton(
                        child: Text('GO'),
                        onPressed: () async {
                          try {
                            Dialogs.showLoadingDialog(context, _globalKey);
                            QueryModel query = QueryModel();
                            var connection =  await Database.instance.connectionDao.find(widget.connectionId);
                            query.connection = ConnectionModel.fromTable(connection);
                            query.query = widget.queryEditingController.text;

                            await _controller.fetchQuery(query).whenComplete(() {
                              Navigator.of(_globalKey.currentContext, rootNavigator: true).pop();
                              FocusScope.of(context).requestFocus(new FocusNode());
                              _scrollToBottom();
                              _saveQuery(QuerySaved(query: widget.queryEditingController.text, databaseInfoId: widget.databaseInfoId));
                            });
                          } catch(e) {
                            Dialogs.errorDialog(e, context);
                          print(e);
                          }
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Observer(
            builder: (_) {
              if(_controller.columns.length == 0) return Container();


              return Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height - Scaffold.of(context).appBarMaxHeight,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - Scaffold.of(context).appBarMaxHeight - 40,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Observer(
                          builder: (_) {

                            var items = _controller.rows.map((row) {
                              var temp = row.values.map((value) => DataCell(Text(value.toString()), onTap: () {
                                showViewDialog(context: context, item: Map<String, dynamic>.from(row), types: _controller.types, connectionId: widget.connectionId);
                              }));
                              return DataRow(cells: List<DataCell>.from(temp));
                            });
                            List<DataRow> cells = List<DataRow>.from(items);

                            return DataTable(
                              sortColumnIndex: _controller.columnSortIndex,
                              sortAscending: _controller.columnSortAsc,
                              columns: _controller.columns.map((value) =>
                                  DataColumn(label: Text(value),
                                      numeric: value.runtimeType == int ||
                                          value.runtimeType == double,
                                      onSort: _controller.changeTableSort))
                                  .toList(),
                              rows: cells,
                            );
                          }
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: (MediaQuery.of(context).size.width / 2) - 20.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 3.0,
                          ),
                        ],
                      ),
                      child: Observer(
                        builder: (_) => IconButton(
                          icon: _controller.onTop ? Icon(Icons.keyboard_arrow_down) : Icon(Icons.keyboard_arrow_up),
                          onPressed: () {
                            if(_controller.onTop) {
                              _scrollToBottom();
                            } else {
                              _scrollToTop();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }


}
