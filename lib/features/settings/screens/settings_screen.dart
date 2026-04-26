import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/ui/components.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          LifeOsCard(
            child: Column(
              children: [
                LifeOsActionRow(
                  title: 'Theme',
                  action: const Icon(Icons.chevron_right),
                  onTap: () {
                    // TODO: Show theme picker
                  },
                ),
                const Divider(),
                LifeOsActionRow(
                  title: 'Notifications',
                  action: Switch.adaptive(
                    value: true,
                    onChanged: (val) {},
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          LifeOsCard(
            child: Column(
              children: [
                LifeOsActionRow(
                  title: 'Export Data (CSV)',
                  action: const Icon(Icons.download),
                  onTap: () {
                    // TODO: Export CSV
                  },
                ),
                const Divider(),
                LifeOsActionRow(
                  title: 'Import Data (CSV)',
                  action: const Icon(Icons.upload),
                  onTap: () {
                    // TODO: Import CSV
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
