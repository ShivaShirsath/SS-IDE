import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';
import 'package:flutter_highlight/themes/darcula.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:flutter_highlight/themes/vs.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:highlight/languages/python.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyClass(),
    ),
  );
}

class MyClass extends StatefulWidget {
  const MyClass({Key? key}) : super(key: key);

  @override
  _MyClassState createState() => _MyClassState();
}

class _MyClassState extends State<MyClass> {
  CodeController? _codeController;
  Map<String, TextStyle>? theme = monokaiSublimeTheme;

  @override
  Widget build(BuildContext context) {
    final source = "void main() {\n    print(\"Hello, world!\");\n}";

    _codeController = CodeController(
      text: source,
      language: python,
      theme: theme,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Code Editor"),
        backgroundColor: Colors.teal,
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: Colors.blueGrey,
              elevation: 20,
              icon: Icon(Icons.color_lens_outlined),
              iconEnabledColor: Colors.white,
              items: <String>['Atom', 'Monokai-sublime', 'VS', 'Darcula']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  onTap: () {
                    setState(() {
                      if (value == "Monokai-sublime") {
                        theme = monokaiSublimeTheme;
                      } else if (value == "Atom") {
                        theme = atomOneDarkTheme;
                      } else if (value == "VS") {
                        theme = vsTheme;
                      } else if (value == "Darcula") {
                        theme = darculaTheme;
                      }
                    });
                  },
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
              onChanged: (_) {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: CodeField(
                controller: _codeController!,
                textStyle: GoogleFonts.getFont(
                  'Cutive Mono',
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: Icon(
          Icons.play_arrow,
        ),
      ),
    );
  }
}
