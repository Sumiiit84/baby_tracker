import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BabySetupScreen extends StatefulWidget {
  const BabySetupScreen({super.key});

  @override
  State<BabySetupScreen> createState() => _BabySetupScreenState();
}

class _BabySetupScreenState extends State<BabySetupScreen> {
  final _nameController = TextEditingController();
  DateTime? _dob;

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("baby_name", _nameController.text);
    if (_dob != null) {
      await prefs.setString("baby_dob", _dob!.toIso8601String());
    }
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(title: const Text("Setup Baby Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Baby Name"),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _dob == null
                        ? "Select Date of Birth"
                        : "DOB: ${_dob!.toLocal().toString().split(' ')[0]}",
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.calendar_today, color: Colors.pink[300]),
                  onPressed: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null) {
                      setState(() {
                        _dob = picked;
                      });
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _saveData, child: const Text("Continue")),
          ],
        ),
      ),
    );
  }
}
