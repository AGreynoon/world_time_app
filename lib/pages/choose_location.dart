import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Aden', location: 'Aden', flag: 'yemen.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Tunis', location: 'Tunis', flag: 'tunis.png'),
    WorldTime(url: 'Africa/Algiers', location: 'Algiers', flag: 'algiers.png'),
    WorldTime(url: 'Africa/Khartoum', location: 'Khartoum', flag: 'sudan.png'),
    WorldTime(url: 'Asia/Gaza', location: 'Gaza', flag: 'palestine.png'),
    WorldTime(url: 'Asia/Riyadh', location: 'Riyadh', flag: 'ksa.png'),
    WorldTime(url: 'Asia/Hong_Kong', location: 'Hong Kong', flag: 'china.png'),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'japane.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Istanbul', location: 'Istanbul', flag: 'turkey.png'),
    WorldTime(url: 'Europe/Paris', location: 'Paris', flag: 'france.png'),
    WorldTime(url: 'America/Los_Angeles', location: 'Los Angeles', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void UpdateTime (index) async
  {
     WorldTime instance = locations[index];
     await instance.GetTime();

     //navigate to home screen
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'IsDayTime': instance.IsDayTime,
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Choose the Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
        itemBuilder: (context,index)
        {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  UpdateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );

        },
      ),
    );
  }
}
