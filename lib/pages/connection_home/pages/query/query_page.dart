import 'package:dbclientapp/database/dao/query_saved_dao.dart';
import 'package:dbclientapp/database/database.dart';
import 'package:dbclientapp/model/connection_model.dart';
import 'package:dbclientapp/model/query_model.dart';
import 'package:dbclientapp/pages/connection_home/pages/query/query_store.dart';
import 'package:dbclientapp/pages/connection_home/pages/query/widgets/query_result_table.dart';
import 'package:dbclientapp/widgets/dialogs.dart';
import 'package:dbclientapp/widgets/flushbar.dart';
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

  QueryPage(
      {Key key, this.databaseInfoId, this.connectionId, this.setQuerySaved})
      : super(key: key);

  final TextEditingController queryEditingController = TextEditingController();

  @override
  _QueryPageState createState() => _QueryPageState();
}

class _QueryPageState extends State<QueryPage> {
  final GlobalKey<State> _globalKey = GlobalKey<State>();
  final QuerySavedDao _querySavedDao = Database.instance.querySavedDao;

  ScrollController _scrollController;
  QueryStore _controller;

  @override
  void initState() {
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.addListener(() {
        _controller.setCurrentScrolledPosition(_scrollController.offset);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _controller = Provider.of<QueryStore>(context);

    _scrollToTop() {
      _scrollController.animateTo(0.0,
          duration: Duration(milliseconds: 500), curve: Curves.easeOut);
    }

    _scrollToBottom() {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 500), curve: Curves.easeOut);
    }

    _saveQuery(QuerySaved querySaved) async {
      var value = widget.queryEditingController.text.trim();

      if (value == '') {
        ShowFlushbar.error(message: 'Query is empty!').show(context);
        return;
      }

      if (querySaved.id != null && querySaved.id > 0) {
        var result = await _querySavedDao.edit(querySaved);
        _controller.setQuery(
            _controller.querySaved.copyWith(id: result, query: value));
      } else {
        var result =
            await _querySavedDao.add(querySaved.copyWith(query: value));
      }
    }

    _handleQuery([value]) async {
      value ??= widget.queryEditingController.text.trim();

      if (value == '') {
        ShowFlushbar.error(message: 'Query is empty!').show(context);
        return;
      }

      try {
        Dialogs.showLoadingDialog(context, _globalKey);
        QueryModel query = QueryModel();
        var connection =
            await Database.instance.connectionDao.find(widget.connectionId);
        query.connection = ConnectionModel.fromTable(connection);
        query.query = value;

        await _controller.fetchQuery(query).whenComplete(() {
          Navigator.of(_globalKey.currentContext, rootNavigator: true).pop();
          FocusScope.of(context).requestFocus(new FocusNode());
        });

        _controller.setLastQueryExecuted(value);

        if (_controller.rows.length > 0) {
          //TODO ANALISAR E DEPOIS DECIDIR SE `E MELHOR SALVAR OU NAO NO HISTORICO QUERYS QUE NAO TENHAM LINHAS RETORNADAS
//          _saveQuery(QuerySaved(query: value, databaseInfoId: widget.databaseInfoId));
          await Future.delayed(Duration(milliseconds: 500));
          _scrollToBottom();
        }
      } catch (e, s) {
        Dialogs.errorDialog(e, context);
      }
    }

    showDialogViewRow(Map<String, dynamic> row) async {
      var result = await showViewDialog(
          context: context,
          item: row,
          types: _controller.types,
          connectionId: widget.connectionId);
      if (result == true) {
        _handleQuery(_controller.lastQueryExecuted);
      }
    }

    return Scaffold(
      floatingActionButton: Observer(
        //TODO exibir com base se a pesquisa foi feita e nao se tem linhas
        builder: (_) {
          return _controller.lastQueryExecuted != ''
              ? SpeedDial(
                  marginBottom: 60.0,
                  animatedIcon: AnimatedIcons.menu_close,
                  backgroundColor: Colors.blueAccent,
                  children: [
                    (_controller.isQueryInSingleTable
                        ? SpeedDialChild(
                            elevation: 8.0,
                            backgroundColor: Colors.green,
                            child: Icon(Icons.add),
                            onTap: () {
                              showViewDialog(
                                  context: context,
                                  item: null,
                                  types: _controller.types,
                                  connectionId: widget.connectionId);
                            },
                          )
                        : Container()),
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
                )
              : Container();
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
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
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
                            WidgetsBinding.instance.addPostFrameCallback(
                                (_) => widget.queryEditingController.clear());
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
                          _saveQuery(_controller.querySaved.copyWith(
                              saved: true,
                              databaseInfoId: widget.databaseInfoId));
                        },
                      ),
                      FlatButton(
                        child: Text('GO'),
                        onPressed: _handleQuery,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Observer(
            builder: (_) {
              if (_controller.columns.length == 0) return Container();

              return Container(
                height: MediaQuery.of(context).size.height -
                    Scaffold.of(context).appBarMaxHeight -
                    20,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Container(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                  maxWidth: MediaQuery.of(context).size.width),
                              child: Observer(
                                builder: (_) {
                                  if (_controller.rows.length == 0 &&
                                      _controller.lastQueryExecuted == '')
                                    return Container();

                                  if (_controller.rows.length == 0 &&
                                      _controller.lastQueryExecuted != '')
                                    return Center(
                                        child: Text(
                                      'This query return empty result',
                                      style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ));

                                  return PaginatedDataTable(
                                    sortColumnIndex:
                                        _controller.columnSortIndex,
                                    sortAscending: _controller.columnSortAsc,
                                    columns: _controller.columns
                                        .map((value) => DataColumn(
                                            label: Text(value),
                                            numeric: value.runtimeType == int ||
                                                value.runtimeType == double,
                                            onSort:
                                                _controller.changeTableSort))
                                        .toList(),
                                    header: Container(),
                                    source: QueryResultTable(
                                        _controller, showDialogViewRow),
                                    rowsPerPage: _controller.rows.length < 50
                                        ? _controller.rows.length
                                        : 50,
                                    availableRowsPerPage: [25, 50, 75, 100],
                                  );
                                },
                              ),
                            )),
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
                          builder: (_) => _controller.rows.length > 0
                              ? IconButton(
                                  icon: _controller.onTop
                                      ? Icon(Icons.keyboard_arrow_up)
                                      : Icon(Icons.keyboard_arrow_down),
                                  onPressed: () {
                                    if (_controller.onTop) {
                                      _scrollToBottom();
                                    } else {
                                      _scrollToTop();
                                    }
                                  },
                                )
                              : Container(),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
