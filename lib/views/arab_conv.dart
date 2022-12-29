import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ArabConv extends StatefulWidget {
  const ArabConv({super.key});

  @override
  State<ArabConv> createState() => _ArabConvState();
}

class _ArabConvState extends State<ArabConv> {

  final romanNum = TextEditingController();
  var pressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: romanNum,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: romanNum.clear,
                  icon: const Icon(Icons.clear),
                ),
                hintText: 'Roman Number',
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
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 3.5,
                    color: pressed ? Colors.red : Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(8),   
                ),
              child: Text(
                pressed ? calcArab(romanNum.text).toString() : 'Insert a number',
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



int calcArab(String numeroRomano) {
  var simboliRomani = {
    'I': 1,
    'V': 5,
    'X': 10,
    'L': 50,
    'C': 100,
    'D': 500,
    'M': 1000,
  };

  int risultato = 0;

  int ultimoValore = 0;
  bool error = false;

  for (int i = numeroRomano.length - 1; i >= 0; i--) {

    if ('IVXLCDM'.contains(numeroRomano[i]) && !error) {
      int valoreCorrente = simboliRomani[numeroRomano[i]]!;

      if (valoreCorrente >= ultimoValore) {
        risultato += valoreCorrente;
      }
      else {
        risultato -= valoreCorrente;
      }

      ultimoValore = valoreCorrente;
    }
    else {
      error = true;
    }
  }

  if (error) {
    return 0;
  } else {
    return risultato;
  }
  
}
