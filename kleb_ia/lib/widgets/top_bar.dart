import 'package:flutter/material.dart';
import 'package:kleb_ia/pages/main_page.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 109, 160, 238),
      leading: Image.asset('assets/images/logo_sem_fundo.png'),
      actions: [
        IconButton(
          icon: const Icon(Icons.home, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const MainPage()),
            );
          },
        ),
      ],
    );
  }
}
