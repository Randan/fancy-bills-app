import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../utils/mocked_data.dart';
import '../../widgets/table.dart';

class HistoryScreen extends StatelessWidget {
  final String title;

  HistoryScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              );
            },
          ),
          title: Text(title),
          centerTitle: true,
          bottom: TabBar(
            unselectedLabelColor: kColorWhite,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 3.0,
                  color: kColorWhite,
                ),
              ),
            ),
            tabs: [
              Tab(
                child: Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('Cold Water'),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('Hot Water'),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('Electricity'),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(kGap),
          child: TabBarView(
            children: [
              AppTable(list: coldWater),
              AppTable(list: hotWater),
              AppTable(list: electricity),
            ],
          ),
        ),
      ),
    );
  }
}
