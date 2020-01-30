import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _audioPlayer = AudioPlayer();
  var _audiocache = AudioCache(prefix: "audios/");
  bool _primeiraExecucao = true;
  double _volume = 0.5;

  _executar() async{
    _audioPlayer.setVolume(_volume);

    if(_primeiraExecucao){
      _audioPlayer = await _audiocache.play("musica.mp3");
      _primeiraExecucao = false;
    }
    else
      _audioPlayer.resume();
  }

  _pausar() async {
    int resultado = await _audioPlayer.pause();
  }

  _parar() async{
    int resultado = await _audioPlayer.stop();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Executando midias"),
      ),
      body: Column(
        children: <Widget>[
          Slider(
            value: _volume,
            min: 0,
            max: 1,
            divisions: 10,
            onChanged: (volume){
              setState(() {
                _volume = volume;
                _audioPlayer.setVolume(volume);
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16),
                child: GestureDetector(
                  onTap: (){
                    _executar();
                  },
                  child: Image.asset("assets/images/executar.png"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: GestureDetector(
                  onTap: (){
                    _pausar();
                  },
                  child: Image.asset("assets/images/pausar.png"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: GestureDetector(
                  onTap: (){
                    _parar();
                  },
                  child: Image.asset("assets/images/parar.png"),
                ),
              ),
            ],
          )

        ],
      ),
    );
  }
}
