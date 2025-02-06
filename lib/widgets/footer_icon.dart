import 'package:flutter/material.dart';

class FooterIconPage extends StatefulWidget {
  const FooterIconPage({super.key});
  @override
  _FooterIconPageState createState() => _FooterIconPageState();
}

class _FooterIconPageState extends State<FooterIconPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          Icons.window_sharp,
          size: 20,
        ),
        Icon(
          Icons.videocam,
          size: 20,
        ),
        Icon(
          Icons.chat,
          size: 20,
        ),
        Icon(
          Icons.settings,
          size: 20,
        ),
      ],
    );
  }
}
