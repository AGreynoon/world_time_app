import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime
{
  late String location; //location name for the UI
  late String time; //the time in the location
  late String flag; //url to an asset flag icon
  late String url; //location url for api endpoint
  late bool IsDayTime; // true or false is daytime or not

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> GetTime () async
  {
    try
    {
      //make the request
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      //get properties from data
      String datetime = data['datetime'];
      String utcoffset = data['utc_offset'].substring(1,3);


      //create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(utcoffset)));

      //set the time property
      IsDayTime = now.hour >= 5 && now.hour <= 17? true : false;
      time = DateFormat.jm().format(now);
    }
    catch(exception)
    {
      print('Error: $exception');
      time = 'time not found!';
    }

  }

}

