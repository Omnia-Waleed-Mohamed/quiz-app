import 'package:flutter/material.dart';

class CustomQuizAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBackPressed;
  final String title;

  const CustomQuizAppBar({
    Key? key,
    this.onBackPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xffEFF0F3),
      elevation: 0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: onBackPressed ?? () => Navigator.pop(context),
            child: Row(
              children: const [
                Icon(Icons.arrow_back_ios, color: Color(0xff473F97), size: 20),
                SizedBox(width: 4),
                Text(
                  "Previous",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff473F97),
                    fontWeight: FontWeight.w600,
                    fontFamily: "Montserrat",
                  ),
                ),
              ],
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontFamily: "Montserrat",
            ),
          ),
          const SizedBox(width: 70), 
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
