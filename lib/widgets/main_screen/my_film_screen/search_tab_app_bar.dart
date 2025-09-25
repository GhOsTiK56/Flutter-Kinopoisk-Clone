import 'package:flutter/material.dart';

class SearchTabAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchTabAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 30);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            //height: 50,
            child: TextField(
              style: TextStyle(color: Colors.white, fontSize: 18),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 8),
                prefixIcon: Icon(Icons.search, color: Colors.grey,),
                suffixIcon: Container(
                  padding: EdgeInsets.only(right: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 1,
                        height: 35,
                        color: Colors.grey,
                        margin: const EdgeInsets.symmetric(horizontal: 1),
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.settings, color: Colors.grey,))
                    ],
                  ),
                ),
                hintText: 'Фильмы, сериалы, мультфильмы',
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: const Color.fromARGB(255, 75, 73, 73),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12),
                )
              ),
            ),
          ),
        ),
      ],
    );
  }
}
