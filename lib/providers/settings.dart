import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier{
  String _units;
  List<String> _waxLines;

  SettingsProvider(){
    _units = "imperial";
    _waxLines = ['swix', 'toko'];
    loadPreferences();
  }

  String get units => _units;
  List<String> get waxLines => _waxLines;

  void setUnits(String units){
    _units = units;
    notifyListeners();
    savePreferences();
  }

  void _setWaxLines(List<String> waxLines){
    _waxLines = waxLines;
    notifyListeners();
  }


  void addWaxLine(String waxLine){
    if(_waxLines.contains(waxLine) == false){
      _waxLines.add(waxLine);
      notifyListeners();
      savePreferences();

    }
  }

  void removeWaxLine(String waxLine){
    if(_waxLines.contains(waxLine) == true){
      _waxLines.remove(waxLine);
      notifyListeners();
      savePreferences();

    }
  }

  savePreferences() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('units', _units);
    preferences.setStringList('waxLines', _waxLines);
  }

  loadPreferences()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String units = preferences.getString("units");
    List<String> waxLines = preferences.getStringList("waxLines");
    if(units != null) setUnits(units);
    if(waxLines != null) _setWaxLines(waxLines);
  }
}