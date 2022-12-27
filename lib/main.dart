import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: GoogleFonts.getFont('Poppins').fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Convertitore Romano'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController arabNum = TextEditingController();
  var pressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arab-Roman Converter'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: arabNum,
              decoration: InputDecoration(
                hintText: 'Arab Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.00),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Convert'),
              onPressed: () {
                pressed = true;
                setState(() {});
              },
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 3.5,
                    color: pressed ? Colors.red : Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(8),   
                ),
              child: Text(
                pressed ? calcRoman(int.parse(arabNum.text)) : 'Insert a number',
                style: TextStyle(
                    fontSize: 40,
                    fontFamily:
                        GoogleFonts.getFont('Playfair Display').fontFamily),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String calcRoman(input) {
  List<int> iNum = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
  List<String> rNum = ['M', 'CM', 'D', 'CD', 'C', 'XC', 'L', 'XL', 'X', 'IX', 'V', 'IV', 'I' ];

  var nRomano = '';

  for (var i = 0; i < iNum.length; i++) {
    while (iNum[i] <= input) {
      nRomano += rNum[i];
      input -= iNum[i];
    }
  }

  return nRomano;
}
