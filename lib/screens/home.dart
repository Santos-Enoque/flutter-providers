import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waxapp/models/report.dart';
import 'package:waxapp/providers/settings.dart';
import 'package:waxapp/screens/settings.dart';
import 'package:waxapp/services/firestore_service.dart';

class Home extends StatelessWidget {
  final FireStoreService _db = FireStoreService();

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    final reports = Provider.of<List<Report>>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Wax"),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Settings()));
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: reports?.length ?? 0,
        itemBuilder: (_, index) {
          Report report = reports[index];
          if(settingsProvider.waxLines.contains(report.line)){
            return ListTile(
              leading: Text(report.temp.toString()),
              title: Text(report.wax),
              subtitle: Text(report.line),
              trailing: Text(
                  formatDate(DateTime.parse(report.timeStamp), [h, ':', nn])),
            );
          }
         return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _db.addReport();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
