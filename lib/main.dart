import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'models/service.dart';
import 'screens/about_page.dart';
import 'screens/service_detail_page.dart';

void main() => runApp(const DubaiOneApp());

class DubaiOneApp extends StatelessWidget {
  const DubaiOneApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'DubaiOne',
    theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF006C4C)), useMaterial3: true, cardTheme: const CardThemeData(elevation: 0, margin: EdgeInsets.zero)),
    home: const HomePage(),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _whatsApp() async {
    await launchUrl(Uri.parse('https://wa.me/971501768878?text=Hello%20DubaiOne%2C%20I%20need%20assistance.'), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('DUBAIONE', style: TextStyle(fontWeight: FontWeight.w900)),
      centerTitle: true,
      actions: [IconButton(tooltip: 'About', icon: const Icon(Icons.info_outline), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutPage())))],
    ),
    body: SafeArea(child: ListView(padding: const EdgeInsets.all(20), children: [
      Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primaryContainer, borderRadius: BorderRadius.circular(24)),
        child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('UAE Services, Made Simple', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
          SizedBox(height: 10),
          Text('Independent professional assistance for visas, immigration, business setup and document clearance across the UAE.'),
        ]),
      ),
      const SizedBox(height: 24),
      Text('Our Services', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
      const SizedBox(height: 12),
      GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: dubaiOneServices.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 1.05),
        itemBuilder: (context, index) {
          final service = dubaiOneServices[index];
          return Card(clipBehavior: Clip.antiAlias, child: InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ServiceDetailPage(service: service))),
            child: Padding(padding: const EdgeInsets.all(14), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(service.icon, size: 36), const SizedBox(height: 10),
              Text(service.title, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.w700)),
              const SizedBox(height: 6), const Text('View details', style: TextStyle(fontSize: 12)),
            ])),
          ));
        },
      ),
      const SizedBox(height: 24),
      FilledButton.icon(onPressed: _whatsApp, icon: const Icon(Icons.chat_outlined), label: const Padding(padding: EdgeInsets.symmetric(vertical: 15), child: Text('Contact DubaiOne on WhatsApp'))),
      const SizedBox(height: 12),
      const Text('+971 50 176 8878', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w600)),
      const SizedBox(height: 18),
      const Text('DubaiOne is an independent assistance service and is not a UAE government authority. Government approvals, fees and eligibility remain subject to the relevant authority.', textAlign: TextAlign.center, style: TextStyle(fontSize: 11)),
    ])),
  );
}
