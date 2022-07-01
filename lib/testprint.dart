import 'package:blue_thermal_printer/blue_thermal_printer.dart';

class TestPrint {
  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

  sample(String pathImage) async {
    //SIZE
    // 0- normal size text
    // 1- only bold text
    // 2- bold with medium text
    // 3- bold with large text
    //ALIGN
    // 0- ESC_ALIGN_LEFT
    // 1- ESC_ALIGN_CENTER
    // 2- ESC_ALIGN_RIGHT

//     var response = await http.get("IMAGE_URL");
//     Uint8List bytes = response.bodyBytes;
    bluetooth.isConnected.then((isConnected) {
      if (isConnected!) {
        bluetooth.printNewLine();
        bluetooth.printCustom("HEADERasdasdasd", 4, 4);
        bluetooth.printNewLine();
        bluetooth.printImage(pathImage); //path of your image/logo
        // bluetooth.printNewLine();
        // bluetooth.printImageBytes(bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes));
        // bluetooth.printNewLine();
        // bluetooth.printCustom("Thank You", 2, 1);
        // bluetooth.printNewLine();
        // bluetooth.printQRcode("asd", 5, 5, 1);
        // bluetooth.printNewLine();
        // bluetooth.printNewLine();
        bluetooth.paperCut();
      }
    });
  }
}
