import 'package:dbclientapp/util/date_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import './history_store.dart';

class HistoryPage extends StatefulWidget {

  final int databaseInfoId;
  final int connectionId;

  const HistoryPage({Key key, this.databaseInfoId, this.connectionId}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {

    HistoryStore _controller = Provider.of<HistoryStore>(context);
    _controller.initData(widget.databaseInfoId);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 12.0, right: 12.0),
        child: Observer(
          builder: (_) => ListView.builder(
            itemCount: _controller.historyList.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Image.asset('assets/images/calendar.png', height: 20.0,),
                  title: Text(_controller.historyList[index].query),
                  subtitle: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Text(DateUtil.dateToFullString(_controller.historyList[index].updatedAt)),
                      )
                  ),
                  trailing: PopupMenuButton(
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(
                          child: Text('Save'),
                          value: 'SAVE',
                        ),
                        PopupMenuItem(
                          child: Text('Delete'),
                          value: 'DELETE',
                        ),
                      ];
                    },

                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
