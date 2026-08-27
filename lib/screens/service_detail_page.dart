import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/service.dart';

class ServiceDetailPage extends StatelessWidget {
  const ServiceDetailPage({super.key, required this.service});
  final DubaiOneService service;

  Future<void> _enquire() async {
    final message = Uri.encodeComponent('Hello DubaiOne, I need help with ${service.title}.');
    final uri = Uri.parse('https://wa.me/971501768878?text=$message');
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(service.title)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          CircleAvatar(radius: 34, child: Icon(service.icon, size: 34)),
          const SizedBox(height: 20),
          Text(service.title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Text(service.description, textAlign: TextAlign.center),
          const SizedBox(height: 24),
          Text('How we can help', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          ...service.items.map((item) => Card(child: ListTile(leading: const Icon(Icons.check_circle_outline), title: Text(item)))),
          const SizedBox(height: 20),
          FilledButton.icon(onPressed: _enquire, icon: const Icon(Icons.chat_outlined), label: const Padding(padding: EdgeInsets.symmetric(vertical: 14), child: Text('Enquire on WhatsApp'))),
          const SizedBox(height: 12),
          const Text('DubaiOne provides document and transaction assistance. Final approval and eligibility are determined by the relevant UAE authority.', textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
