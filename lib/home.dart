import 'dart:io';

import 'package:arduino_code/widgets/appButton.dart';
import 'package:arduino_code/widgets/bottomBox.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<PlatformFile> files = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (files.isEmpty) Text('Add a file') else Text('Files'),
              ListView.builder(
                shrinkWrap: true,
                itemCount: files.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      OpenFile.open(files[index].path);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      color: Colors.grey[200],
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        children: [
                          Text(
                            files[index].name.toString(),
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                            Text(
                            '${double.parse(files[index].size.toString())/100} kB',
                            style: TextStyle(fontSize: 16,),
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomBox(
          child: AppButton(
            title: 'Search File',
            onPressed: () async {
              try {
                FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);

                if (result != null) {
                  PlatformFile file = result.files.first;
                  files.add(file);
                } else {
                  // User canceled the picker
                }
                setState(() {});
              } catch (e) {
                print(e);
              }
            },
          ),
        ));
  }
}
