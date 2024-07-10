import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void SetupWorldTime() async
  {
    WorldTime instance = WorldTime(location: 'Yemen',flag: 'yemen.png',url: 'Asia/Aden');
    await instance.GetTime();
    Navigator.pushReplacementNamed(context, '/home', arguments:
    {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'IsDayTime': instance.IsDayTime,
    });
  }


  @override
  void initState()
  {
    super.initState();
    SetupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: const Center(
        child:
        SpinKitCubeGrid (
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
