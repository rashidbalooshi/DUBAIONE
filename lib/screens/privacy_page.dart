import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Privacy')),
    body: ListView(
      padding: const EdgeInsets.all(20),
      children: const [
        Text('Privacy', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        SizedBox(height: 16),
        Text('DubaiOne does not require an account in the current version and does not intentionally collect personal information inside the app.'),
        SizedBox(height: 12),
        Text('When you choose WhatsApp, you leave DubaiOne and communicate using WhatsApp. Information you voluntarily send there may be used to respond to your enquiry.'),
        SizedBox(height: 12),
        Text('Avoid sending unnecessary sensitive information. This notice must be updated if future versions add forms, analytics, payments, accounts, advertising or cloud storage.'),
      ],
    ),
  );
}
