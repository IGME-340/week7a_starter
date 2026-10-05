import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // TODO Step 1: three TextEditingControllers (name, email, password)
  // TODO Step 4: three FocusNodes, created in initState()
  // TODO Steps 1 + 4: dispose() every controller and focus node

  @override
  Widget build(BuildContext context) {
    // TODO Step 8: wrap the Scaffold in a GestureDetector that dismisses the keyboard
    return Scaffold(
      appBar: AppBar(
        title: Text("Week 7A"),
        backgroundColor: Colors.blueAccent,
      ),
      // TODO Step 9: wrap the body in a SingleChildScrollView so the keyboard can't cover fields
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sign Up Form",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // TODO Step 1: controller + textInputAction on each field
            // TODO Step 2: a clear button (suffixIcon) on each field
            // TODO Step 5: focusNode + onEditingComplete on each field
            TextFormField(
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              // TODO Step 6: dismiss the keyboard when Submit is pressed
              onPressed: () {},
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
