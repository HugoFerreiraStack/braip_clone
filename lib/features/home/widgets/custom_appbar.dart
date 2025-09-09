import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Builder(
        builder: (context) => IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(Icons.menu, color: Colors.black87),
        ),
      ),
      title: Row(
        children: [
          Expanded(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.visibility_off, color: Colors.black87),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ),
          SizedBox(width: 8),
          const Icon(Icons.attach_money, color: Colors.black87, size: 20),
          SizedBox(width: 4),
          Row(
            children: [
              Text(
                'BRL (R\$)',
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.flag, color: Colors.green, size: 16),
              const SizedBox(width: 4),
              const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black87,
                size: 16,
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.help_outline, color: Colors.black87),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications, color: Colors.black87),
        ),
        Container(
          margin: const EdgeInsets.only(right: 16),
          child: const CircleAvatar(
            radius: 18,
            backgroundColor: Color(0xFF6B46C1),
            child: Icon(Icons.person, color: Colors.white, size: 20),
          ),
        ),
      ],
    );
  }
}
