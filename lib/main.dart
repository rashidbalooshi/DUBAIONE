import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const DubaiOneApp());

class DubaiOneApp extends StatelessWidget {
  const DubaiOneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DubaiOne',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0B6B4F)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const services = <Map<String, dynamic>>[
    {'title': 'UAE Visa Services', 'icon': Icons.badge_outlined},
    {'title': 'Golden Visa', 'icon': Icons.workspace_premium_outlined},
    {'title': 'Family Visa', 'icon': Icons.family_restroom},
    {'title': 'Immigration Services', 'icon': Icons.public},
    {'title': 'Open Sponsor File', 'icon': Icons.folder_open_outlined},
    {'title': 'Company Formation', 'icon': Icons.business_outlined},
    {'title': 'Document Clearance', 'icon': Icons.description_outlined},
    {'title': 'Government Transactions', 'icon': Icons.account_balance_outlined},
  ];

  Future<void> _whatsApp() async {
    final uri = Uri.parse('https://wa.me/971501768878?text=Hello%20DubaiOne%2C%20I%20need%20assistance.');
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DUBAIONE', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text('UAE Government Services, Made Simple',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800)),
            const SizedBox(height: 8),
            const Text('Professional assistance for visas, immigration, company setup and document clearance across the UAE.'),
            const SizedBox(height: 24),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: services.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.25,
              ),
              itemBuilder: (context, index) {
                final item = services[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(item['icon'] as IconData, size: 34),
                        const SizedBox(height: 10),
                        Text(item['title'] as String,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _whatsApp,
              icon: const Icon(Icons.chat_outlined),
              label: const Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Text('Contact DubaiOne on WhatsApp'),
              ),
            ),
            const SizedBox(height: 12),
            const Text('+971 50 176 8878', textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
