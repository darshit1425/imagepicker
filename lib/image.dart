import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:timer_snackbar/timer_snackbar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String uri = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xFF008069),
            title: Text(
              "Profile",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.arrow_back)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(uri),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: IconButton(
                      onPressed: () async {
                        ImagePicker imagePicker = ImagePicker();
                        XFile? xfile = await imagePicker.pickImage(
                            source: ImageSource.gallery);
                        setState(() {
                          uri = xfile!.path;
                        });
                      },
                      icon: Icon(Icons.camera_alt_outlined),
                    ),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  timerSnackbar(
                      context: context,
                      contentText: "Update is live",
                      afterTimeExecute: () => print("done"),
                      second: 10);
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
