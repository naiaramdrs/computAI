import 'package:kleb_ia/pages/main_page.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.indigo.shade400,
      automaticallyImplyLeading: false, // remove seta de back
      centerTitle: true, // centraliza a logo
      title: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const MainPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    const begin = Offset(0.0, -1.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOut;
                    final tween = Tween(
                      begin: begin,
                      end: end,
                    ).chain(CurveTween(curve: curve));
                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
              transitionDuration: const Duration(milliseconds: 700),
            ),
          );
        },
        child: Image.asset(
          'assets/images/logo_horizontal.png',
          height: 40,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
