import 'package:flutter/material.dart';
import 'package:notepad/models/note.dart';
import 'package:provider/provider.dart';

class SearchBarNote extends StatelessWidget {
  const SearchBarNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nt = Provider.of<Note>(context);

    return TextField(
      onChanged: (value) => nt.filter(value),
      decoration: InputDecoration(
        floatingLabelStyle: const TextStyle(color: Colors.black),
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
        labelStyle: WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
          final Color color = states.contains(WidgetState.error)
              ? Theme.of(context).colorScheme.error
              : Colors.grey;

          return TextStyle(color: color, fontWeight: FontWeight.bold);
        }),
      ),
    );
  }
}
