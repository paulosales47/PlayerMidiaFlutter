import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  _executarAudio() async{
/*    var player = AudioPlayer();
    int resultado = await player.play("https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3");
    if(resultado == 1){
    }*/

    var audioCache = AudioCache(prefix: "audios/");
    AudioPlayer audioplayer = await audioCache.play("musica.mp3");

  }

  @override
  Widget build(BuildContext context) {
    _executarAudio();
    return Container();
  }
}
