import 'package:dbclientapp/database/database.dart';
import 'package:dbclientapp/model/connection_model.dart';
import 'package:dbclientapp/model/query_model.dart';
import 'package:dbclientapp/pages/connection_home/pages/query/query_store.dart';
import 'package:dbclientapp/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class QueryPage extends StatefulWidget {
  @override
  _QueryPageState createState() => _QueryPageState();
}

class _QueryPageState extends State<QueryPage> {

  final GlobalKey<State> _globalKey = GlobalKey<State>();
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

    _getRows() {
      var items = _controller.rows.map((row) {
        var temp = row.values.map((value) => DataCell(Text(value.toString())));
        return DataRow(cells: List<DataCell>.from(temp));
      });
      return List<DataRow>.from(items);
    }


    return Scaffold(
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
                      initialValue: _controller.query,
                      onChanged: _controller.setQuery,
                      decoration: InputDecoration(
                        labelText: 'Query',
                        suffix: GestureDetector(
                          child: Icon(Icons.close),
                          onTap: () {
                                _controller.query = '';
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

                        },
                      ),
                      FlatButton(
                        child: Text('GO'),
                        onPressed: () async {
                          try {
                            Dialogs.showLoadingDialog(context, _globalKey);
                            QueryModel query = QueryModel();
                            var connection =  await Database.instance.connectionDao.find(1);
                            query.connection = ConnectionModel.fromTable(connection);
                            query.query = _controller.query;

                            await _controller.fetchQuery(query).whenComplete(() {
                              Navigator.of(_globalKey.currentContext, rootNavigator: true).pop();

                              FocusScope.of(context).requestFocus(new FocusNode());

                              Future.delayed(Duration(seconds: 1)).then((_) {
                                _scrollToBottom();
                              });
                            });
                          } catch(e) {
                            print(e);
//                            Dialogs.errorDialog(e, true, context);
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
                children: <Widget>[

                  Container(
                    height: MediaQuery.of(context).size.height - Scaffold.of(context).appBarMaxHeight,
//                    color: Colors.red,
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height - Scaffold.of(context).appBarMaxHeight - 40,
//                      color: Colors.green,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columns: _controller.columns.map((value) => DataColumn(label: Text(value))).toList(),
                            rows: _getRows(),
                          ),
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
