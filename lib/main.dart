import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'models/service.dart';
import 'screens/about_page.dart';
import 'screens/service_detail_page.dart';

const navy = Color(0xFF071827);
const navy2 = Color(0xFF0D2538);
const gold = Color(0xFFD4AF37);
const softGold = Color(0xFFF1D57A);

void main() => runApp(const DubaiOneApp());

class DubaiOneApp extends StatelessWidget {
  const DubaiOneApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'DubaiOne',
    theme: ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: navy,
      colorScheme: const ColorScheme.dark(primary: gold, secondary: softGold, surface: navy2),
      useMaterial3: true,
    ),
    home: const HomePage(),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selected = 0;

  Future<void> _whatsApp() async {
    await launchUrl(Uri.parse('https://wa.me/971501768878?text=Hello%20DubaiOne%2C%20I%20need%20assistance.'), mode: LaunchMode.externalApplication);
  }

  void _service(DubaiOneService service) => Navigator.push(context, MaterialPageRoute(builder: (_) => ServiceDetailPage(service: service)));

  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: Drawer(
      backgroundColor: navy,
      child: SafeArea(child: Column(children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 22, 20, 18),
          child: Row(children: [
            _D1Logo(size: 58), SizedBox(width: 14),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('DUBAIONE', style: TextStyle(color: gold, fontSize: 22, fontWeight: FontWeight.w900, letterSpacing: 1.5)),
              Text('VISA & DOCUMENT CLEARANCE', style: TextStyle(color: Colors.white70, fontSize: 9, letterSpacing: .7)),
            ])),
          ]),
        ),
        const Divider(color: Colors.white12, height: 1),
        Expanded(child: ListView(padding: const EdgeInsets.symmetric(vertical: 8), children: [
          _menu(Icons.home_rounded, 'Home', () => Navigator.pop(context)),
          _menu(Icons.grid_view_rounded, 'Our Services', () => Navigator.pop(context)),
          _menu(Icons.badge_rounded, 'Visa Services', () => _openByTitle('UAE Visa Services')),
          _menu(Icons.workspace_premium_rounded, 'Golden Visa', () => _openByTitle('Golden Visa')),
          _menu(Icons.family_restroom_rounded, 'Family Visa', () => _openByTitle('Family Visa')),
          _menu(Icons.business_center_rounded, 'PRO Services', () => _openByTitle('Government Transactions')),
          _menu(Icons.description_rounded, 'Document Clearance', () => _openByTitle('Document Clearance')),
          _menu(Icons.apartment_rounded, 'Company Formation', () => _openByTitle('Company Formation')),
          _menu(Icons.folder_shared_rounded, 'Sponsor File', () => _openByTitle('Sponsor File')),
          _menu(Icons.fact_check_rounded, 'Status Check', () => Navigator.pop(context)),
          _menu(Icons.sell_rounded, 'Our Packages', () => Navigator.pop(context)),
          _menu(Icons.chat_rounded, 'Contact Us', () { Navigator.pop(context); _whatsApp(); }),
          _menu(Icons.info_rounded, 'About Us', () { Navigator.pop(context); Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutPage())); }),
        ])),
        const Padding(padding: EdgeInsets.all(18), child: Text('+971 50 176 8878', style: TextStyle(color: softGold, fontWeight: FontWeight.bold))),
      ])),
    ),
    appBar: AppBar(
      backgroundColor: navy,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      title: const Row(mainAxisSize: MainAxisSize.min, children: [
        _D1Logo(size: 34), SizedBox(width: 9),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('DUBAIONE', style: TextStyle(color: gold, fontWeight: FontWeight.w900, fontSize: 18, letterSpacing: 1.4)),
          Text('VISA & DOCUMENT CLEARANCE', style: TextStyle(fontSize: 7.5, color: Colors.white60, letterSpacing: .6)),
        ]),
      ]),
    ),
    body: SafeArea(child: ListView(padding: const EdgeInsets.fromLTRB(16, 8, 16, 24), children: [
      Container(
        padding: const EdgeInsets.fromLTRB(20, 26, 20, 24),
        decoration: BoxDecoration(
          gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [navy2, Color(0xFF102F45)]),
          border: Border.all(color: gold.withValues(alpha: .45)),
          borderRadius: BorderRadius.circular(24),
        ),
        child: const Column(children: [
          Icon(Icons.location_city_rounded, color: gold, size: 54),
          SizedBox(height: 14),
          Text('YOUR TRUSTED PARTNER IN\nUAE IMMIGRATION SERVICES', textAlign: TextAlign.center, style: TextStyle(fontSize: 23, height: 1.18, fontWeight: FontWeight.w900, color: Colors.white)),
          SizedBox(height: 10),
          Text('Fast. Reliable. Professional.', style: TextStyle(color: softGold, fontSize: 15, fontWeight: FontWeight.w700, letterSpacing: .5)),
        ]),
      ),
      const SizedBox(height: 25),
      const Text('HOW CAN WE HELP YOU?', textAlign: TextAlign.center, style: TextStyle(color: gold, fontSize: 19, fontWeight: FontWeight.w900, letterSpacing: 1.1)),
      const SizedBox(height: 16),
      GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: dubaiOneServices.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 1.12),
        itemBuilder: (_, i) {
          final s = dubaiOneServices[i];
          return Material(
            color: navy2,
            borderRadius: BorderRadius.circular(18),
            child: InkWell(
              borderRadius: BorderRadius.circular(18),
              onTap: () => _service(s),
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.white12), borderRadius: BorderRadius.circular(18)),
                padding: const EdgeInsets.all(14),
                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(width: 48, height: 48, decoration: BoxDecoration(color: gold.withValues(alpha: .12), shape: BoxShape.circle), child: Icon(s.icon, color: gold, size: 27)),
                  const SizedBox(height: 10),
                  Text(s.title, textAlign: TextAlign.center, maxLines: 2, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13.5)),
                ]),
              ),
            ),
          );
        },
      ),
      const SizedBox(height: 22),
      Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(color: navy2, borderRadius: BorderRadius.circular(20), border: Border.all(color: gold.withValues(alpha: .35))),
        child: Column(children: [
          const Text('NEED HELP?', style: TextStyle(color: gold, fontSize: 18, fontWeight: FontWeight.w900)),
          const SizedBox(height: 6),
          const Text('Speak directly with DubaiOne', style: TextStyle(color: Colors.white70)),
          const SizedBox(height: 14),
          SizedBox(width: double.infinity, child: FilledButton.icon(style: FilledButton.styleFrom(backgroundColor: gold, foregroundColor: navy, padding: const EdgeInsets.symmetric(vertical: 15)), onPressed: _whatsApp, icon: const Icon(Icons.chat_rounded), label: const Text('WHATSAPP US', style: TextStyle(fontWeight: FontWeight.w900)))),
        ]),
      ),
      const SizedBox(height: 16),
      const Text('DubaiOne is an independent assistance service and is not a UAE government authority.', textAlign: TextAlign.center, style: TextStyle(fontSize: 10, color: Colors.white38)),
    ])),
    bottomNavigationBar: NavigationBar(
      backgroundColor: navy2,
      indicatorColor: gold.withValues(alpha: .18),
      selectedIndex: selected,
      onDestinationSelected: (i) {
        setState(() => selected = i);
        if (i == 4) _whatsApp();
      },
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home_rounded, color: gold), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.grid_view_outlined), selectedIcon: Icon(Icons.grid_view_rounded, color: gold), label: 'Services'),
        NavigationDestination(icon: Icon(Icons.sell_outlined), selectedIcon: Icon(Icons.sell_rounded, color: gold), label: 'Packages'),
        NavigationDestination(icon: Icon(Icons.fact_check_outlined), selectedIcon: Icon(Icons.fact_check_rounded, color: gold), label: 'Status'),
        NavigationDestination(icon: Icon(Icons.chat_outlined), selectedIcon: Icon(Icons.chat_rounded, color: gold), label: 'Contact'),
      ],
    ),
  );

  Widget _menu(IconData icon, String title, VoidCallback tap) => ListTile(
    leading: Icon(icon, color: gold, size: 22),
    title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
    trailing: const Icon(Icons.chevron_right_rounded, color: Colors.white30),
    onTap: tap,
  );

  void _openByTitle(String title) {
    Navigator.pop(context);
    final matches = dubaiOneServices.where((s) => s.title == title);
    if (matches.isNotEmpty) _service(matches.first);
  }
}

class _D1Logo extends StatelessWidget {
  const _D1Logo({required this.size});
  final double size;
  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: gold, width: 2), color: const Color(0xFF0B2234)),
    alignment: Alignment.center,
    child: Text('D1', style: TextStyle(color: gold, fontWeight: FontWeight.w900, fontSize: size * .36, letterSpacing: -1)),
  );
}
