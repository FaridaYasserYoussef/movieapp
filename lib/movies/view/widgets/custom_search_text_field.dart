import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  final Function(String) onChanged;
  final TextEditingController searchController;
  const CustomSearchTextField({
    super.key,
    required this.onChanged,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: searchController,
      style: Theme.of(context).textTheme.titleMedium,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFF514F4F),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(30),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(30),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(30),
        ),
        prefixIcon: IconButton(
          icon: const Icon(
            Icons.search,
          ),
          color: Colors.white,
          onPressed: () {},
        ),
        hintText: 'Search',
        hintStyle:
            Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 20),
      ),
    );
  }
}
