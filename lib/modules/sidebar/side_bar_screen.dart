import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

class SideBarScreen extends StatefulWidget {
  const SideBarScreen({super.key});

  @override
  State<SideBarScreen> createState() => _SideBarScreenState();
}

class _SideBarScreenState extends State<SideBarScreen> {
  int index = 0;
  bool isExpanded = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: NavigationRail(
                extended: isExpanded,
                backgroundColor: Colors.white,
                unselectedIconTheme:
                    const IconThemeData(color: Colors.grey, opacity: 1),
                unselectedLabelTextStyle: const TextStyle(color: Colors.grey),
                selectedIconTheme: IconThemeData(color: Colors.blue.shade400),
                selectedLabelTextStyle: TextStyle(color: Colors.blue.shade400),
                destinations: const [
                  NavigationRailDestination(
                      icon: SvgIcon(
                        icon: SvgIconData(
                          'images/vector.svg',
                        ),
                        size: 20,
                      ),
                      label: Text('الرئيسية')),
                  NavigationRailDestination(
                    icon: SvgIcon(
                      icon: SvgIconData(
                        'images/person.svg',
                      ),
                      size: 20,
                    ),
                    label: Text('الأطباء'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.settings),
                    label: Text('الإعدادات'),
                  ),
                  NavigationRailDestination(
                    icon: SvgIcon(
                      icon: SvgIconData(
                        'images/message.svg',
                      ),
                      size: 20,
                    ),
                    label: Text('الرسائل'),
                  ),
                ],
                selectedIndex: index,
                onDestinationSelected: (index) => setState(() {
                  this.index = index;
                }),
              ),
            )
          ],
        ),
      ],
    );
  }
}
