import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NoteListScreen(),
    );
  }
}

class NoteListScreen extends StatefulWidget {
  @override
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  List<Note> notes = [];
  int selectedNoteIndex = -1;

  void _addNote(Note note) {
    setState(() {
      notes.add(note);
    });
  }

  void _selectNote(int index) {
    setState(() {
      if (selectedNoteIndex == index) {
        // Toggle off if the same note is clicked again
        selectedNoteIndex = -1;
      } else {
        selectedNoteIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note List'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _selectNote(index);
            },
            child: Container(
              color: selectedNoteIndex == index ? Colors.yellow : null,
              child: ListTile(
                title: Text(notes[index].title),
                subtitle: Text(notes[index].description),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNoteScreen(_addNote)),
          );
        },
        tooltip: 'Add Note',
        child: Icon(Icons.add),
      ),
    );
  }
}

class Note {
  String title;
  String description;

  Note({
    required this.title,
    required this.description,
  });
}

class AddNoteScreen extends StatefulWidget {
  final Function(Note) onNoteAdded;

  AddNoteScreen(this.onNoteAdded);

  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 16),
            Text('Description', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8.0),
                  border: InputBorder.none,
                ),
                maxLines: 5, // Set the number of lines you want for the text box
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String title = _titleController.text;
                String description = _descriptionController.text;

                if (title.isNotEmpty && description.isNotEmpty) {
                  Note newNote = Note(
                    title: title,
                    description: description,
                  );

                  widget.onNoteAdded(newNote);

                  Navigator.pop(context); // Go back to the NoteListScreen
                } else {
                  // Show an error message if title or description is empty
                  // You can customize this part based on your requirements
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Title and Description cannot be empty.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
