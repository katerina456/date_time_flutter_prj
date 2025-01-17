import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;   //location name for the UI
  String time = '';       //the time in the location
  String flag;       //url to an asset flag icon
  String url;        //location url for api endpoint
  bool isDaytime = false;     //true or false if daytime or not

    WorldTime( { this.location = '', this.flag = '', this.url = '' } );

  Future<void> getTime() async {
    // make the request
    try {
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      //print(response.body);
      //print(data['utc_offset']);

      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      //print(now);
      // set the time property
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch(e) {
      print('caught error: $e');
      time = 'could not get time data';
    }

  }
}

