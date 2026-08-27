import 'package:flutter/material.dart';
import '../models/service.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key, required this.service, required this.onTap});
  final DubaiOneService service;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Card(
    clipBehavior: Clip.antiAlias,
    child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(service.icon, size: 36),
          const SizedBox(height: 10),
          Text(service.title, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: 6),
          const Text('View details', style: TextStyle(fontSize: 12)),
        ]),
      ),
    ),
  );
}
