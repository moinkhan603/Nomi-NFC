import 'dart:io';
import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';
import 'package:vcard/vcard.dart';

import 'CRUD.dart';

class VCARD{

VCARD();
  var vCard = VCard();
Directory _downloadsDirectory;


  saveVcard()async{
    vCard.firstName = CRUD.name;

    vCard.organization = 'ActivSpaces Labs';
    vCard.photo.attachFromUrl('https://www.activspaces.com/wp-content/uploads/2019/01/ActivSpaces-Logo_Dark.png', 'PNG');
    vCard.workPhone = 'Work Phone Number';
    vCard.jobTitle = 'Software Developer';
    vCard.url = 'https://github.com/valerycolong';
    vCard.note = 'Notes on contact';
    Directory dir = await getApplicationDocumentsDirectory();
   // File testFile = new File("${dir.path}/image.png");
    saveToFile('contact.vcf');
    /// Save to file

    /// Get as formatted string
    print(vCard.getFormattedString());
  }
saveToFile(filename) async {
  String contents = vCard.getFormattedString();
  Directory downloadsDirectory;
  // Platform messages may fail, so we use a try/catch PlatformException.
  try {
    downloadsDirectory = await DownloadsPathProvider.downloadsDirectory;

  } on PlatformException {
    print('Could not get the downloads directory');
  }
  _downloadsDirectory=downloadsDirectory;
  //Future<Directory> _downloadsDirectory=initDownloadsDirectoryState();

 // final directory = await getApplicationDocumentsDirectory();
  final fs = File('${_downloadsDirectory.path}/$filename');
  print(fs.toString());
  fs.writeAsStringSync(contents);
  File test = new File("${_downloadsDirectory.path}/contact.vcf");
  if (await test.exists()) {
//      await testFile.create(recursive: true);
//      testFile.writeAsStringSync("test for share documents file");

    ShareExtend.share(test.path, "file");
  }
}

  ///Set properties

Sharefile()async{
  print(_downloadsDirectory);
  Directory dir = await getApplicationDocumentsDirectory();
// File test=vCard.saveToFile('${dir.path}/contact.vcf') as dynamic;
  File test = new File("${_downloadsDirectory.path}/vCard/exports/contact.vcf");
  if (await test.exists()) {
//      await testFile.create(recursive: true);
//      testFile.writeAsStringSync("test for share documents file");

  ShareExtend.share(test.path, "file");
  }
}




}



