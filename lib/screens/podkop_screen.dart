import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:luci_mobile/design/luci_design_system.dart';
import 'package:luci_mobile/main.dart';
import 'package:luci_mobile/models/podkop.dart';
import 'package:luci_mobile/state/app_state.dart';
import 'package:luci_mobile/widgets/luci_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class PodkopScreen extends ConsumerStatefulWidget {
  const PodkopScreen({super.key});

  @override
  ConsumerState<PodkopScreen> createState() => _PodkopScreenState();
}

class _PodkopScreenState extends ConsumerState<PodkopScreen>
    with SingleTickerProviderStateMixin {
  bool isInstalling = false;

  @override
  Widget build(BuildContext context) {
    final appState = ref.read(appStateProvider);
    return Scaffold(
      appBar: const LuciAppBar(title: 'Podkop', showBack: true),
      body: FutureBuilder<Map<String, dynamic>>(
        future: appState.fetchPodkopConfig(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return SizedBox();
          final data = snapshot.data as Map<String, dynamic>;
          if (data['installed'] == false) {
            return _introducePodkop(appState);
          }

          //Podkop is installed
          final podkopConfig = PodkopInterface.fromJson(data);

          return _dashboard(podkopConfig);
        },
      ),
    );
  }

  Widget _dashboard(PodkopInterface podkopConfig) {
    return Padding(
      padding: EdgeInsets.all(LuciSpacing.md),
      child: ListView(
        children: [
          Tooltip(
            message: 'Enter the IP address or hostname of your router',
            child: DropdownButton<String>(
              items: <String>['proxy', 'VPN', 'Block'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {},
              value: podkopConfig.mode
            )
          ),
        ],
      ),
    );
  }
  // TextFormField(
  // autofocus: true,
  // autofillHints: const [AutofillHints.url, AutofillHints.username],
  // decoration: const InputDecoration(
  // labelText: 'Connection Type',
  // border: OutlineInputBorder(),
  // prefixIcon: Icon(Icons.router_outlined),
  // helperText: 'Select between VPN and Proxy connection methods for traffic routing',
  // ),
  // textInputAction: TextInputAction.next,
  // validator: (value) {
  // if (value == null || value.isEmpty) {
  // return 'Please enter the router address';
  // }
  // return null;
  // },
  // ),
  Widget _introducePodkop(AppState appState) {
    return Padding(
      padding: EdgeInsets.all(LuciSpacing.md),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "A tool for routers based on the OpenWrt system that allows directing specific domains, IP addresses, and subnets into a proxy, VPN, or tunnels.",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 12),
          Text(
            "Based on sing-box. Uses the FakeIP scheme.",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              const Icon(Icons.info_outline, size: 18),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  "Currently in beta testing.",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                'View on GitHub',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              IconButton(
                icon: const Icon(Icons.open_in_new, size: 20),
                onPressed: () {
                  launchUrl(
                    Uri.parse('https://github.com/itdoginfo/podkop'),
                    mode: LaunchMode.externalApplication,
                  );
                },
              ),
            ],
          ),
          const Divider(),
          const SizedBox(height: 12),
          const Text("To proceed with installation, please ensure that SSH access is available on port 22 and password authentication is enabled."),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 24), // bottom padding
            child: SizedBox(
              width: double.infinity, // square
              height: 56, // square
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  foregroundColor: Theme.of(context).colorScheme.onSecondary,
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 20,
                  ),
                ),
                icon: isInstalling
                    ? SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      )
                    : const Icon(Icons.download),
                label: Text(isInstalling ? 'Installing...' : 'Install Podkop'),
                onPressed: isInstalling
                    ? null
                    : () async {
                        setState(() => isInstalling = true);
                        try {
                          final isInstalled = await appState.installPodkop();
                          if (isInstalled == true) {
                            setState(() {
                              isInstalling = false;
                            });
                          }
                        } finally {
                          setState(() => isInstalling = false);
                        }
                      },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
