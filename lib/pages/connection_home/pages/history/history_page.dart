import 'package:dbclientapp/database/database.dart';
import 'package:dbclientapp/util/date_util.dart';
import 'package:dbclientapp/widgets/dialogs.dart';
import 'package:dbclientapp/widgets/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import './history_store.dart';

class HistoryPage extends StatefulWidget {

  final int databaseInfoId;
  final int connectionId;
  final Function useQuerySaved;

  const HistoryPage({Key key, this.databaseInfoId, this.connectionId, this.useQuerySaved}) : super(key: key);

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
              QuerySaved item = _controller.historyList[index];
              return Card(
                child: ListTile(
                  onTap: () {
                    widget.useQuerySaved(item.query);
                  },
                  leading: Image.asset('assets/images/calendar.png', height: 20.0,),
                  title: Text(item.query),
                  subtitle: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Text(DateUtil.dateToFullString(item.updatedAt)),
                      )
                  ),
                  trailing: PopupMenuButton(
                    onSelected: (value) async {
                      switch(value) {
                        case 'SAVE':
                          await Database.instance.querySavedDao.edit(item.copyWith(saved: true));
                          ShowFlushbar.saved(context);
                          break;
                        case 'DELETE':
                          bool result = await Dialogs.deleteDialog(context);
                          if(result == true) {
                            await Database.instance.querySavedDao.remove(item.id);
                            ShowFlushbar.deleted(context);
                          }
                          break;
                      }
                    },
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
