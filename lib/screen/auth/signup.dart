import 'package:flutter/material.dart';
import 'package:house_rent/services/auth_service.dart';
import 'package:house_rent/widget/custom_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  void _signUp() async {
    if (_formKey.currentState!.validate()) {
      final user = await _authService.signUpUsingEmailPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        context: context,
      );
      if (user != null) {
        // Navigate to the Home Screen
        Navigator.of(context).pushReplacementNamed('/login');
      } else {
        // Show error message if sign up fails
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Sign up Failed')));
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomTextField(
                hintText: 'Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8.0),
              CustomTextField(
                hintText: 'Student ID',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid student ID';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8.0),
              CustomTextField(
                controller: _emailController,
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8.0),
              CustomTextField(
                controller: _passwordController,
                hintText: 'Password',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _signUp,
                child: Text('Sign Up'),
              ),
              SizedBox(height: 8.0),
              TextButton(
                onPressed: () => Navigator.of(context).pushNamed('/login'),
                child: Text('Already have an account? Log in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
