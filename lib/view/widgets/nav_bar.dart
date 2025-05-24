import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:srocks_music_assignment/view/widgets/notifier_widget.dart';

class CustomNavBar extends StatefulWidget {
  final Function(int) onTabChanged;

  const CustomNavBar({
    Key? key,
    required this.onTabChanged,
  }) : super(key: key);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0;

  final List<Map<String, String>> _navItems = [
    {'icon': 'assets/icons/home.png', 'label': 'Home'},
    {'icon': 'assets/icons/news.svg', 'label': 'News'},
    {'icon': 'assets/icons/trackbox.svg', 'label': 'TrackBox'},
    {'icon': 'assets/icons/workspace.svg', 'label': 'Projects'},
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index != 0) {
      final tabName = _navItems[index]['label']!;
      _showTabNotifier(context, tabName);
    }

    widget.onTabChanged(index);
  }

  void _showTabNotifier(BuildContext context, String tabName) {
    NotifierHelper.showNotifier(context, 'You tapped $tabName');
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        border: Border(top: BorderSide(color: Colors.grey[800]!, width: 0.5)),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -15,
            left: (screenWidth / 4) * _selectedIndex + (screenWidth / 8) - 10,
            child: Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
            ),
          ),
          // Navigation items
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            top: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(_navItems.length, (index) {
                final isSelected = _selectedIndex == index;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => _onItemTapped(index),
                    behavior: HitTestBehavior.opaque,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Icon
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: index == 0
                              ? Image.asset(
                            _navItems[index]['icon']!,
                            height: 24,
                            width: 24,
                            color: isSelected ? Colors.white : Colors.grey[600],
                          )
                              : SvgPicture.asset(
                            _navItems[index]['icon']!,
                            colorFilter: ColorFilter.mode(
                              isSelected ? Colors.white : Colors.grey[600]!,
                              BlendMode.srcIn,
                            ),
                            height: 24,
                            width: 24,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Label
                        Text(
                          _navItems[index]['label']!,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.grey[600],
                            fontSize: 12,
                            fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}