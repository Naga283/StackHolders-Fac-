
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';


class PrintVal extends StatelessWidget {
  const PrintVal(this.title, {Key? key,required this.data}) : super(key: key);
final dynamic  data;
  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: PdfPreview(
          build: (format) => _generatePdf(format, title),
        ),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final font = await PdfGoogleFonts.nunitoExtraLight();

    pdf.addPage(
    
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(
            children: [
               pw.ListView.builder(
                 itemCount: data.length,
                 itemBuilder: (context, int index) {
                   return 
                   pw.Column(children: [
                     pw. Text("${data[index]["Question"]}", style: pw.TextStyle(font: font,fontSize: 30)),
                   //
                   // pw. Text("${data[index]["Option1"]}", style: pw.TextStyle(font: font,fontSize: 30))
                   ]);
                     
                     // pw. Text("${data[index]["Option1"]}", style: pw.TextStyle(font: font,fontSize: 30)),
                    
                 },
               ),
                
                  // child: pw.Text(title, style: pw.TextStyle(font: font,fontSize: 30)),
                
              
             
            ],
          );
        },
     ),
     
      
    );
pdf.addPage(
 
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(
            children: [
               pw.ListView.builder(
                 itemCount: data.length,
                 itemBuilder: (context, int index) {
                   return 
                   pw.Column(children: [
                     pw. Text("${data[index]["Question"]}", style: pw.TextStyle(font: font,fontSize: 30)),
                   //
                   // pw. Text("${data[index]["Option1"]}", style: pw.TextStyle(font: font,fontSize: 30))
                   ]);
                     
                     // pw. Text("${data[index]["Option1"]}", style: pw.TextStyle(font: font,fontSize: 30)),
                    
                 },
               ),
                
                  // child: pw.Text(title, style: pw.TextStyle(font: font,fontSize: 30)),
                
              
             
            ],
          );
        },
      ),);
      pw.MultiPage(
        build: (context) {
  return [
    pw.Text('Hello'),
    pw.Text('World'),
  ];
}
      );
    return pdf.save();
  }
}