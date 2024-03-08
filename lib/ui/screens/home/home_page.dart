import 'dart:developer';
import 'dart:io';

import 'package:assignment/ui/widgets/video_player_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? file;
  String? fileUrl;
  UploadTask? uploadTask;
  bool isUploading=false;
  late VideoPlayerController _controller;

Future<void>pickFile()async{
  if(await Permission.storage.request().isGranted){


    FilePickerResult? result=await FilePicker.platform.pickFiles(
      type: FileType.media,
      allowMultiple: false,
    );
    if(result !=null){
      setState(() {
        file=File(result.files.single.path!);
      });
    }

  }else {
    if (await Permission.storage.request().isPermanentlyDenied) {

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Permission Required"),
            content: const Text(
              "Please enable storage permission in the app settings to upload files.",
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  openAppSettings(); // Open app settings
                },
                child: Text("Settings"),
              ),
            ],
          );
        },
      );
    } else {
      // The permission was denied, but not permanently. Try again.
      // You can show a message to inform the user and try again.
    }
  }
}

Future<void>uploadFile()async{
  if(file==null) return;
  setState(() {
    isUploading=true;
  });
  FirebaseStorage storage=FirebaseStorage.instance;
  Reference ref=storage.ref().child('uploads/${DateTime.now().toString()}');
  try{
    String contentType='application/octet-stream';
    if (file!.path.toLowerCase().endsWith('.jpg') ||
        file!.path.toLowerCase().endsWith('.jpeg')) {
      contentType = 'image/jpeg';
    } else if (file!.path.toLowerCase().endsWith('.png')) {
      contentType = 'image/png';
    } else if (file!.path.toLowerCase().endsWith('.mp4')) {
      contentType = 'video/mp4';
    }


    uploadTask=ref.putFile(file!,SettableMetadata(contentType: contentType));
    uploadTask!.snapshotEvents.listen((TaskSnapshot snapshot) {
      log("Task State : ${snapshot.state}");
      log("Progress : ${(snapshot.bytesTransferred / snapshot.totalBytes)*100}%");

    });
    await uploadTask!.whenComplete(()async{
      if (uploadTask!.snapshot.state == TaskState.success) {
        EasyLoading.showSuccess("file uploaded successfully");
        String downloadUrl = await ref.getDownloadURL();
        setState(() {
          fileUrl = downloadUrl;
          isUploading = false;
        });
      }


    });
  }catch(e){
    log("File upload failed: $e");
    setState(() {
      isUploading=false;
    });
    EasyLoading.showError("$e");

  }

}

@override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("File upload Firebase"),
      ),
      body: Column(

        children: [
          const SizedBox(
            height: 20,
          ),
          // select file button
          InkWell(
            onTap: (){
            pickFile();
            },
            child: Container(
              height:40,
              width: MediaQuery.of(context).size.width/2,
              margin:EdgeInsets.all(30) ,
              decoration:  BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(12)),
              child: const Center(
                child: Text("Choose File",style: TextStyle(color: Colors.white),),
              ),
            ),
          ),

          file != null
              ? Image.file(
            file!,
            height: 200,
          )
              : Container(),





          //file upload button
          InkWell(
            onTap: (){
              uploadFile();
            },
            child: Container(
              height:40,
              width: MediaQuery.of(context).size.width/2,
              margin:EdgeInsets.all(30) ,
              decoration:  BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(12)),
              child: const Center(
                child: Text("File upload",style: TextStyle(color: Colors.white),),
              ),
            ),
          ),
          isUploading?Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(),
          )
              : SizedBox(),
          SizedBox(height: 20,),
          fileUrl!=null?fileUrl!.endsWith('.mp4')?VideoPlayerWidget(fileUrl: fileUrl!):Image.network(fileUrl!,height: 100,width: MediaQuery.of(context).size.width,):SizedBox()

        ],
      ),
    );
  }
}
