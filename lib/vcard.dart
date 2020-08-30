import 'dart:io';
import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';
import 'package:vcard/vcard.dart';

import 'CRUD.dart';

class VCARD {
  VCARD();
  var vCard = VCard();
  Directory _downloadsDirectory;


  saveVcard() async {
    vCard.firstName = CRUD.name;
    vCard.email = CRUD.email;
    vCard.photo.attachFromUrl(CRUD.imgUrl, 'JPEG');
    vCard.workPhone = CRUD.Number;
    vCard.jobTitle = CRUD.Occupation;
    Directory dir = await getApplicationDocumentsDirectory();
    saveToFile('vCardFile.vcf');
    print('vcard');
    print(vCard.getFormattedString());
  }

  saveToFile(filename) async {
    String contents = vCard.getFormattedString();
    Directory downloadsDirectory;

    try {
//      downloadsDirectory = await DownloadsPathProvider.downloadsDirectory;
    } on PlatformException {
      print('Could not get the downloads directory');
    }
    _downloadsDirectory = downloadsDirectory;
     _downloadsDirectory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();

    final fs = File('${_downloadsDirectory.path}/$filename');
    print(fs.toString());
    fs.writeAsStringSync(contents);
    File test = new File("${_downloadsDirectory.path}/vCardFile.vcf");
    if (await test.exists()) {
      ShareExtend.share(test.path, "file");
    }
  }

  Sharefile() async {
    print(_downloadsDirectory);
    Directory dir = await getApplicationDocumentsDirectory();
    File test =
        new File("${_downloadsDirectory.path}/vCard/exports/vCardFile.vcf");
    if (await test.exists()) {
      ShareExtend.share(test.path, "file");
    }
  }
}
