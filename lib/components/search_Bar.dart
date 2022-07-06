import 'package:flutter/material.dart';
import 'package:notepad/models/note.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nt = Provider.of<Note>(context);

    return TextField(
      onChanged: (value) => nt.filter(value),
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.circular(20.0)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.circular(20.0)),
        filled: true,
        fillColor: const Color(0x94d5e9f8),
        labelText: 'Search notes',
        labelStyle:
            MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
          final Color color = states.contains(MaterialState.error)
              ? Theme.of(context).errorColor
              : Colors.grey;

          return TextStyle(color: color, fontWeight: FontWeight.bold);
        }),
      ),
    );
  }
}
