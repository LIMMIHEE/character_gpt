import 'package:character_gpt/view/data/provider/rive_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

class DashAnimation extends StatefulWidget {
  const DashAnimation({super.key});

  @override
  State<DashAnimation> createState() => _DashAnimationState();
}

class _DashAnimationState extends State<DashAnimation> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 650,
      child: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text('Remix file by the Flutter Lover', style: TextStyle(
              color: Colors.grey
            ),),
          ),
          GestureDetector(
            onTap: (){
              context.read<RiveProvider>().wavePlay();
            },
            child: RiveAnimation.asset(
              'assets/rive/flutter_dash.riv',
              fit: BoxFit.fitHeight,
              controllers: [
                context.read<RiveProvider>().winkController,
                context.read<RiveProvider>().waveController,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
