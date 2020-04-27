import 'package:dbclientapp/pages/connection_home/pages/favorite/favorite_store.dart';
import 'package:dbclientapp/util/date_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {

  final int databaseInfoId;
  final int connectionId;

  const FavoritePage({Key key, this.databaseInfoId, this.connectionId}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {

  @override
  Widget build(BuildContext context) {

    FavoriteStore _controller = Provider.of<FavoriteStore>(context);
    _controller.initData(widget.databaseInfoId);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 12.0, right: 12.0),
        child: Observer(
          builder: (_) => ListView.builder(
            itemCount: _controller.favoriteList.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Image.asset('assets/images/favorite.png', height: 20.0,),
                  title: Text(_controller.favoriteList[index].query),
                  subtitle: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Text(DateUtil.dateToFullString(_controller.favoriteList[index].updatedAt)),
                      )
                  ),
                  trailing: PopupMenuButton(
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(
                          child: Text('Edit'),
                          value: 'EDIT',
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
