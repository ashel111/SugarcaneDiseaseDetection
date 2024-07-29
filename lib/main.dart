/*import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as path;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'CaneSafe'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  String _predictedClass = '';
  String _score = '';

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final File imageFile = File(pickedFile.path);

      // Load the image using the image package
      final img.Image? image = img.decodeImage(imageFile.readAsBytesSync());
      if (image != null) {
        // Resize the image
        final img.Image resizedImage = img.copyResize(image, width: 224, height: 224);

        // Save the resized image to a new file
        final File resizedFile = File('${imageFile.parent.path}/resized_${path.basename(imageFile.path)}');
        resizedFile.writeAsBytesSync(img.encodeJpg(resizedImage));

        setState(() {
          _image = resizedFile;
        });
      }
    }
  }

  Future<void> _uploadImage() async {
    if (_image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No image selected')),
      );
      return;
    }

    final Uri uri = Uri.parse('http://192.168.60.123:5001/predict'); // Updated endpoint
    final request = http.MultipartRequest('POST', uri);
    request.files.add(await http.MultipartFile.fromPath(
      'file',
      _image!.path,
      contentType: MediaType('image', path.extension(_image!.path).replaceAll('.', '')),
    ));

    try {
      final response = await request.send();
      final responseData = await response.stream.bytesToString();
      final Map<String, dynamic> result = jsonDecode(responseData);

      setState(() {
        _predictedClass = result['label'] ?? 'Unknown';
        _score = result['score']?.toStringAsFixed(2) ?? '0.0'; // Format score to 2 decimal places
      });
    } catch (error) {
      setState(() {
        _predictedClass = 'Error';
        _score = '0.0';
      });
      print("Error uploading image: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Upload an image for prediction:'),
            const SizedBox(height: 20),
            _image == null
                ? const Text('No image selected.')
                : Image.file(_image!),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Pick and Resize Image'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadImage,
              child: const Text('Upload and Predict'),
            ),
            const SizedBox(height: 20),
            Text('Predicted Class: $_predictedClass'),
            const SizedBox(height: 10),
            Text('Score: $_score'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
*/

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as path;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'CaneSafe'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  String _predictedClass = '';
  String _score = '';

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final File imageFile = File(pickedFile.path);

      // Load the image using the image package
      final img.Image? image = img.decodeImage(imageFile.readAsBytesSync());
      if (image != null) {
        // Resize the image
        final img.Image resizedImage = img.copyResize(image, width: 224, height: 224);

        // Save the resized image to a new file
        final File resizedFile = File('${imageFile.parent.path}/resized_${path.basename(imageFile.path)}');
        resizedFile.writeAsBytesSync(img.encodeJpg(resizedImage));

        setState(() {
          _image = resizedFile;
        });
      }
    }
  }

  Future<void> _uploadImage() async {
    if (_image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No image selected')),
      );
      return;
    }

    final Uri uri = Uri.parse('http://192.168.60.123:5001/predict'); // Updated endpoint
    final request = http.MultipartRequest('POST', uri);
    request.files.add(await http.MultipartFile.fromPath(
      'file',
      _image!.path,
      contentType: MediaType('image', path.extension(_image!.path).replaceAll('.', '')),
    ));

    try {
      final response = await request.send();
      final responseData = await response.stream.bytesToString();
      final Map<String, dynamic> result = jsonDecode(responseData);

      setState(() {
        _predictedClass = result['label'] ?? 'Unknown';
        _score = result['score']?.toStringAsFixed(2) ?? '0.0'; // Format score to 2 decimal places
      });
    } catch (error) {
      setState(() {
        _predictedClass = 'Error';
        _score = '0.0';
      });
      print("Error uploading image: $error");
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Container(
        alignment: Alignment.center,
        child: Text(widget.title)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Upload an image for prediction:'),
            const SizedBox(height: 20),
            _image == null
                ? const Text('No image selected.')
                : Image.file(_image!),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Pick and Resize Image'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadImage,
              child: const Text('Upload and Predict'),
            ),
            const SizedBox(height: 20),
            Text('Predicted Class: $_predictedClass'),
            const SizedBox(height: 10),
            Text('Score: $_score'),
          ],
        ),
      ),

    );
  }
}
