class Report{
  final int temp;
  final String wax;
  final String line;
  final String timeStamp;

  Report({this.temp, this.wax, this.line, this.timeStamp});

  Report.fromMap(Map<String, dynamic> data)
      : temp = data['temp'],
        wax = data['wax'],
        line = data['line'],
        timeStamp = data['timeStamp'];


}