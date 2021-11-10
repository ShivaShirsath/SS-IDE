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
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CodeController? _codeController;
  Map<String, TextStyle>? theme = monokaiSublimeTheme;
  bool wrap = false;

  @override
  Widget build(BuildContext context) {
    const source = "void main() {\n    print(\"Hello, world!\");\n}";

    _codeController = CodeController(
      text: source,
      language: python,
      theme: theme,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SS IDE",
        ),
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: Colors.blueGrey,
              elevation: 20,
              icon: const Icon(
                Icons.format_color_fill,
              ),
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
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (_) {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: CodeField(
          wrap: wrap,
          controller: _codeController!,
          textStyle: GoogleFonts.getFont(
            'Cutive Mono',
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
            () {},
          );
        },
        child: const Icon(
          Icons.play_arrow,
        ),
      ),
    );
  }
}
