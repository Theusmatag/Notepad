import 'package:flutter/material.dart';
import 'package:notepad/models/note.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var notas = ModalRoute.of(context)?.settings.arguments as Note;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color(0xff3F2EF4),
                      size: 40,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(8, 15, 0, 10),
                  child: Text(
                    'Note',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(23, 15, 23, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notas.date!,
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(notas.title!,
                      style:
                          const TextStyle(fontSize: 23, color: Colors.black54)),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    notas.annotation!,
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
