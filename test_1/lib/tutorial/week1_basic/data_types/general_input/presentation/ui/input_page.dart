import 'package:flutter/material.dart';
import '../../data/repositories/profile_repo_impl.dart';
import '../controller/input_controller.dart';

class InputPage extends StatefulWidget{
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final _controller = InputController(ProfileRepoImpl());

  final _nameController = TextEditingController();
  final _yearText = TextEditingController();
  final _pointsText = TextEditingController();
  bool _isVip = false;


  @override
  void initState(){
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _yearText,
              decoration: InputDecoration(labelText: 'Birth Year'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _pointsText,
              decoration: InputDecoration(labelText: 'Points'),
              keyboardType: TextInputType.number,
            ),
            SwitchListTile(
              title: Text('VIP Status'),
              value: _isVip,
              onChanged: (bool value) {
                setState(() {
                  _isVip = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                _controller.submitData(
                  _nameController.text,
                  _yearText.text,
                  _pointsText.text,
                  _isVip,
                );
                setState(() {});
              },
              child: Text('Submit'),
            ),
            if (_controller.errorMessage.isNotEmpty)
              Text(
                _controller.errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            if (_controller.data != null)
              Text('Profile Created: ${_controller.data!.name}, Age: ${_controller.data!.age}, VIP: ${_controller.data!.isVIP}'),
          ],
        ),
      ),
    );
  }

}