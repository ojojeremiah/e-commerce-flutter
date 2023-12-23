import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class PictureEditing extends StatefulWidget {
  const PictureEditing({super.key});

  @override
  State<PictureEditing> createState() => _PictureEditingState();
}

class _PictureEditingState extends State<PictureEditing> {
  File? _imageFile;

  String? _imageUrl;

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) _imageFile = File(pickedFile.path);
      if (_imageFile != null) _uploadImage();
    });
  }

  Future<void> _uploadImage() async {
    final url = Uri.parse('https://api.cloudinary.com/v1_1/dzlafnxpu/upload');
    final request = http.MultipartRequest('POST', url)
      ..fields['upload_preset'] = 'tagphbbd'
      ..files.add(await http.MultipartFile.fromPath('file', _imageFile!.path));
    debugPrint("After request: ");
    final response = await request.send();
    if (response.statusCode == 200) {
      print("Before reponse data");
      final responseData = await response.stream.toBytes();
      final responseString = String.fromCharCodes(responseData);
      final jsonMap = jsonDecode(responseString);
      setState(() {
        final url = jsonMap['url'];
        _imageUrl = url;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(color: Colors.orange),
          child: TextButton(
              onPressed: () {
                _pickImage(ImageSource.camera);
              },
              child: const Text(
                'Take a picture',
                style: TextStyle(color: Colors.white),
              )),
        ),
        Container(
          decoration: const BoxDecoration(color: Colors.orange),
          child: TextButton(
              onPressed: () {
                _pickImage(ImageSource.gallery);
              },
              child: const Text('Choose from gallery')),
        ),
        // if (_imageFile != null) ...[
        //   Image.file(_imageFile!),
        //   TextButton(
        //       onPressed: () {
        //         print('Before upload function');
        //         _uploadImage();
        //       },
        //       child: const Text('Upload to Cloudinary'))
        // ],
        if (_imageUrl != null) ...[
          Image.network(_imageUrl!),
          Text("Cloudinary URL: $_imageUrl")
        ]
      ],
    );
  }
}
