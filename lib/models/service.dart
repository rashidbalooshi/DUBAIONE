import 'package:flutter/material.dart';

class DubaiOneService {
  const DubaiOneService({
    required this.title,
    required this.description,
    required this.icon,
    required this.items,
  });

  final String title;
  final String description;
  final IconData icon;
  final List<String> items;
}

const dubaiOneServices = <DubaiOneService>[
  DubaiOneService(title: 'UAE Visa Services', description: 'Support for UAE residence and entry permit procedures.', icon: Icons.badge_outlined, items: ['Entry permits', 'Residence visa assistance', 'Visa renewal', 'Visa cancellation', 'Status change guidance']),
  DubaiOneService(title: 'Golden Visa', description: 'Assistance with long-term UAE residency applications.', icon: Icons.workspace_premium_outlined, items: ['Eligibility guidance', 'Property investor cases', 'Family sponsorship', 'Application document review']),
  DubaiOneService(title: 'Family Visa', description: 'Family sponsorship and residence support.', icon: Icons.family_restroom, items: ['Spouse sponsorship', 'Children sponsorship', 'Parents sponsorship', 'Renewal and cancellation']),
  DubaiOneService(title: 'Immigration Services', description: 'Practical support for immigration-related transactions.', icon: Icons.public, items: ['Application preparation', 'Document checking', 'Status follow-up guidance', 'Typing assistance']),
  DubaiOneService(title: 'Sponsor File', description: 'Help with opening and managing sponsorship files.', icon: Icons.folder_open_outlined, items: ['Sponsor file guidance', 'Required documents', 'Application preparation']),
  DubaiOneService(title: 'Company Formation', description: 'Support for UAE business setup and licensing formalities.', icon: Icons.business_outlined, items: ['Trade license guidance', 'Company setup documents', 'Government formalities', 'Renewal support']),
  DubaiOneService(title: 'Document Clearance', description: 'Document preparation and government transaction support.', icon: Icons.description_outlined, items: ['Application typing', 'Document review', 'Government submissions guidance', 'Transaction follow-up']),
  DubaiOneService(title: 'Government Transactions', description: 'General PRO support across common UAE government procedures.', icon: Icons.account_balance_outlined, items: ['PRO services', 'Government portals', 'Application preparation', 'Transaction guidance']),
];
