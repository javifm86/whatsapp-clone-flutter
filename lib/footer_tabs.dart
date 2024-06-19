import 'package:flutter/material.dart';
import 'package:whatsapp/notification_badge.dart';

class FooterTabs extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const FooterTabs({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: IconItem(
            icon: Icons.chat,
            isSelected: selectedIndex == 0,
            showNotificationBadge: true,
            textNotificationBadge: '6',
          ),
          label: 'Chats',
        ),
        BottomNavigationBarItem(
          icon: IconItem(
            icon: Icons.bubble_chart,
            isSelected: selectedIndex == 1,
            showNotificationBadge: true,
            rightNotificationBadge: 14,
          ),
          label: 'Updates',
        ),
        BottomNavigationBarItem(
          icon: IconItem(
            icon: Icons.groups,
            isSelected: selectedIndex == 2,
            rightNotificationBadge: 14,
          ),
          label: 'Communities',
        ),
        BottomNavigationBarItem(
          icon: IconItem(
            icon: Icons.call_outlined,
            isSelected: selectedIndex == 3,
            showNotificationBadge: true,
            textNotificationBadge: '1',
          ),
          label: 'Calls',
        ),
      ],
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      selectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,
    );
  }
}

class IconItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final bool showNotificationBadge;
  final String textNotificationBadge;
  final double? topNotificationBadge;
  final double? rightNotificationBadge;

  const IconItem({
    super.key,
    required this.icon,
    required this.isSelected,
    this.showNotificationBadge = false,
    this.textNotificationBadge = '',
    this.topNotificationBadge,
    this.rightNotificationBadge,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? Colors.green[700] : Colors.grey[700];
    final bgIconColor = isSelected
        ? const Color.fromARGB(255, 203, 240, 214)
        : Colors.transparent;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: bgIconColor,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 24.0),
          margin: const EdgeInsets.only(bottom: 6.0),
          child: Icon(
            icon,
            color: color,
          ),
        ),
        showNotificationBadge
            ? Positioned(
                top: topNotificationBadge ?? 0,
                right: rightNotificationBadge ?? 20,
                child: NotificationBadge(text: textNotificationBadge),
              )
            : const SizedBox(),
      ],
    );
  }
}
