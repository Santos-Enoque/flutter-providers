import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waxapp/providers/settings.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Units"),
                DropdownButton<String>(
                    value: settingsProvider.units,
                    items: <String>[
                      'imperial', 'metric'
                    ].map<DropdownMenuItem<String>>((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e))).toList(),
                    onChanged: (value){
                      settingsProvider.setUnits(value);
                })
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Wax Lines"),
                Container(
                  child: Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: [
                      FilterChip(label: Text("swix"),selected: settingsProvider.waxLines.contains('swix') ,onSelected: (value){
                        if(value == false){
                          settingsProvider.removeWaxLine('swix');
                        }else{
                          settingsProvider.addWaxLine('swix');
                        }
                      }),
                      FilterChip(label: Text("toko"),selected: settingsProvider.waxLines.contains('toko'), onSelected: (value){
                        if(value == false){
                          settingsProvider.removeWaxLine('toko');
                        }else{
                          settingsProvider.addWaxLine('toko');
                        }
                      }),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
