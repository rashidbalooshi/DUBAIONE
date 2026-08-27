import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About DubaiOne')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Icon(Icons.apartment_rounded, size: 72),
          SizedBox(height: 18),
          Text('DubaiOne', textAlign: TextAlign.center, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Text('DubaiOne helps customers understand and request independent assistance for common UAE PRO, visa, immigration, business setup and document-clearance procedures.', textAlign: TextAlign.center),
          SizedBox(height: 24),
          ListTile(leading: Icon(Icons.chat_outlined), title: Text('WhatsApp'), subtitle: Text('+971 50 176 8878')),
          Divider(),
          Text('DubaiOne is not an official UAE government authority. Final decisions, eligibility, fees and processing are controlled by the relevant authority.', textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
