import 'package:character_gpt/view/data/provider/chat_provider.dart';
import 'package:character_gpt/view/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await dotenv.load(fileName: 'assets/.env');

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ChatProvider()),
    ],
    child: const MyApp(),
  ));
}
