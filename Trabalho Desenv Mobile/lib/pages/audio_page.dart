import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/sound_service.dart';
import '../services/timer_service.dart';


class AudioPage extends StatefulWidget {
  final File file;
  const AudioPage(this.file);

  @override
  State<AudioPage> createState() => _AudioPage(file);
}

class _AudioPage extends State<AudioPage> {
  late File file;
  final controller = TimerController();
  final recorder = SoundRecorder();
  AudioPlayer AudioComponentPlayer = AudioPlayer();
  _AudioPage(this.file);

  @override
  void initState() {
    _initState();
    super.initState();
    recorder.init();
  }

  @override
  void dispose() {
    recorder.dispose();
    super.dispose();
  }

  void _initState() async {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: constroiBotao(),
      ),
    );
  }

  Widget constroiBotao() {
    final gravando = recorder.isRecording;
    final icon = gravando ? Icons.stop : Icons.mic;
    final text = gravando ? 'STOP' : 'START';
    final primary = gravando ? Colors.red : Colors.white;
    final onPrimary = gravando ? Colors.white : Colors.black;

    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          /*foregroundColor: onPrimary, minimumSize: Size(175, 50), primary: primary*/),
      icon: Icon(icon),
      label: Text(text),
      onPressed: () async {
        await recorder.toggleRecording();
        final gravando = recorder.isRecording;
        setState(() {
          if (gravando) {
            controller.startTimer();
          } else {
            controller.stopTimer();
          }
        });
      },
    );
  }
}