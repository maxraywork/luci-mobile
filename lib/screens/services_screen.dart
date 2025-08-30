import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luci_mobile/screens/podkop_screen.dart';
import 'package:luci_mobile/widgets/luci_app_bar.dart';
import 'package:luci_mobile/design/luci_design_system.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LuciAppBar(title: 'Services'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: LuciSpacing.md),
        child: GridView.count(
          crossAxisCount: 3,
          children: [
            _buildMenuItem(
              context: context,
              iconPath: 'assets/icons/podkop.svg',
              label: 'Podkop',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const PodkopScreen()),
                );
              },
            ),
            _buildMenuItem(
              context: context,
              iconPath: 'assets/icons/wireguard.svg',
              label: 'WireGuard',
              isComingSoon: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required BuildContext context,
    required String iconPath,
    required String label,
    VoidCallback? onTap,
    bool isComingSoon = false,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                iconPath,
                width: 40,
                height: 40,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: 8),
              Text(label),
              if (isComingSoon) Text("Coming soon"),
            ],
          ),
        ),
      ),
    );
  }
}
