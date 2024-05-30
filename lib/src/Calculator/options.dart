import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Options extends StatefulWidget {
  const Options({
    super.key,
    required this.question,
    required this.isSelected,
    required this.currentIndex,
    required this.selectedAnswerIndex,
  });

  final String question;
  final bool isSelected;
  final int? selectedAnswerIndex;
  final int currentIndex;

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  
  @override
  Widget build(BuildContext context) {
    return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    widget.question,
                    style: GoogleFonts.abel(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 20,
                    ),
                  ),
                ],
              ),
          ),
        );
      
    
    
  
  }
}
