import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class RomConv extends StatefulWidget {
  const RomConv({super.key});

  @override
  State<RomConv> createState() => _RomConvState();
}

class _RomConvState extends State<RomConv> {

  TextEditingController arabNum = TextEditingController();
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
              controller: arabNum,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: arabNum.clear,
                  icon: const Icon(Icons.clear),
                ),
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
              padding: const EdgeInsets.all(10.0),
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
