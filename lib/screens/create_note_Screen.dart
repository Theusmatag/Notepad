import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notepad/screens/home_Screen.dart';
import 'package:provider/provider.dart';
import '../models/note.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({Key? key}) : super(key: key);

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  @override
  Widget build(BuildContext context) {
    final noteController = TextEditingController();
    final titleController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final func = Provider.of<Note>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text('Do you want to go out ?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (ctx) => const HomeScreen())),
                                child: const Text(
                                  'Yes',
                                  style: TextStyle(color: Color(0xff3F2EF4)),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  return Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'No',
                                  style: TextStyle(
                                    color: Color(0xff3F2EF4),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xff3F2EF4),
                        size: 34,
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    const Text(
                      'Build your Note',
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextFormField(
                          textCapitalization: TextCapitalization.sentences,
                          decoration: const InputDecoration(
                            labelText: 'Title',
                          ),
                          controller: titleController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          maxLines: 1,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Text Field is empty';
                            } else {
                              return null;
                            }
                          },
                        ),
                        TextFormField(
                          textCapitalization: TextCapitalization.sentences,
                          decoration:
                              const InputDecoration(labelText: 'Your note here !'),
                          controller: noteController,
                          textAlign: TextAlign.justify,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (_) => func.done,
                          maxLines: null,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Text Field is empty';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final isValid = formKey.currentState?.validate() ?? false;
            if (!isValid) return;
            func.done(
                noteController.text,
                titleController.text,
                DateFormat(
                  ' MMMM dd,  yyyy - hh:mm a ',
                ).format(DateTime.now()),
                Random().nextDouble().toString());
            Navigator.of(context).pop();
          },
          backgroundColor: const Color(0xff3F2EF4),
          child: const Icon(Icons.done),
        ),
      ),
    );
  }
}
