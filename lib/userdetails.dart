import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const UserDetailsApp());
}

class UserDetailsApp extends StatelessWidget {
  const UserDetailsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'User Details Form',
      home: UserDetailsForm(),
    );
  }
}

class UserDetailsForm extends StatefulWidget {
  const UserDetailsForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserDetailsFormState createState() => _UserDetailsFormState();
}

class _UserDetailsFormState extends State<UserDetailsForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process the data
      String name = _nameController.text;
      String email = _emailController.text;

      // Here you can process or save the user details
      // For now, let's print them
      if (kDebugMode) {
        print('Name: $name');
      }
      if (kDebugMode) {
        print('Email: $email');
      }

      // You can navigate to another screen or perform other actions here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // You can add more complex validation here if needed
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}