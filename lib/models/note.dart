import 'package:flutter/material.dart';
import 'package:notepad/Database/Db.dart';

class Note with ChangeNotifier {
  String? title;
  String? date;
  String? annotation;
  String? id;

  Note({this.title, this.date, this.annotation, this.id});

  @override
  String toString() {
    // TODO: implement toString
    return '$title, $date,$annotation,$id';
  }

  List<Note> notas = [];
  List<Note> teste = [];

  Future<void> loadPlaces() async {
    final noteList = await DbUtil.getData('notes');
    notas = noteList
        .map(
          (n) => Note(
            id: n['id'],
            annotation: n['annotation'],
            date: n['date'],
            title: n['title'],
          ),
        )
        .toList();
    teste = notas;
    notifyListeners();
  }

  void done(String annotation, String title, String date, String id) {
    if (title.isEmpty && annotation.isEmpty) {
      return;
    }
    notas.add(Note(
      title: title,
      date: date,
      annotation: annotation,
      id: id,
    ));

    DbUtil.insert('notes', {
      'id': id,
      'title': title,
      'date': date,
      'annotation': annotation,
    });
    notifyListeners();
  }

  void filter(String search) {
    if (search.isEmpty) {
      teste = notas;
    } else {
      teste = notas
          .where((element) =>
              element.title!.toLowerCase().contains(search.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  void remove(Note nota) {
    int index = teste.indexWhere((element) => element.id == nota.id);

    if (index >= 0) {
      notas.removeWhere((element) => element.id == nota.id);
      teste.removeWhere((element) => element.id == nota.id);
    }

    DbUtil.delete('notes', nota.id!);
    notifyListeners();
  }

  @override
  void notifyListeners();
}
