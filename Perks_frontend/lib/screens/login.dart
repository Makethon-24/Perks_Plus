import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'cards.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _hovering = false;
//   bool _clicked = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFC2D7F1),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.only(top: 50.0),
//                   child: Image.asset('assets/images/logtext.png'),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 50.0),
//                   child: Center(
//                     child: Image.asset('assets/images/login.png',
//                         height: 200.0, width: 200.0),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 50.0),
//                   child: TextFormField(
//                     controller: _usernameController,
//                     decoration: InputDecoration(labelText: 'User ID'),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your username';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 20.0),
//                   child: TextFormField(
//                     controller: _passwordController,
//                     decoration: InputDecoration(labelText: 'Password'),
//                     obscureText: true,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your password';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 20.0),
//                   child: MouseRegion(
//                     onEnter: (_) => setState(() => _hovering = true),
//                     onExit: (_) => setState(() => _hovering = false),
//                     child: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           _clicked = true;
//                         });
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => ChangePasswordPage()),
//                         );
//                       },
//                       child: RichText(
//                         text: TextSpan(
//                           text: 'Forgot Password? ',
//                           style: TextStyle(color: Colors.black),
//                           children: [
//                             TextSpan(
//                               text: 'Click here',
//                               style: TextStyle(
//                                 color: Colors.blue,
//                                 decoration: _hovering || _clicked
//                                     ? TextDecoration.underline
//                                     : TextDecoration.none,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 20.0),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => CardsPage()),
//                         );
//                       }
//                     },
//                     child: Text('Submit'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ChangePasswordPage extends StatefulWidget {
//   @override
//   _ChangePasswordPageState createState() => _ChangePasswordPageState();

// }
// class _ChangePasswordPageState extends State<ChangePasswordPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFC2D7F1),
//       appBar: AppBar(
//         title: Text('Change Password'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: <Widget>[
//               TextFormField(
//                 controller: _passwordController,
//                 decoration: InputDecoration(labelText: 'New Password'),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your new password';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _confirmPasswordController,
//                 decoration: InputDecoration(labelText: 'Confirm New Password'),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value != _passwordController.text) {
//                     return 'Passwords do not match';
//                   }
//                   return null;
//                 },
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     // Process data.
//                     print('Password changed successfully');
//                   }
//                 },
//                 child: Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey;
  final TextEditingController _usernameController;
  final TextEditingController _passwordController;
  final VoidCallback onLogin;

  LoginForm({
    required GlobalKey<FormState> formKey,
    required TextEditingController usernameController,
    required TextEditingController passwordController,
    required this.onLogin,
  })  : _formKey = formKey,
        _usernameController = usernameController,
        _passwordController = passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Image.asset('assets/images/logtext.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Center(
              child: Image.asset('assets/images/login.png', height: 200.0, width: 200.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'User ID'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  onLogin(); // Trigger login logic
                }
              },
              child: const Text('Submit'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: MouseRegion(
              onEnter: (_) => print('Hover'),
              onExit: (_) => print('Hover out'),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangePasswordPage(),
                    ),
                  );
                },
                child: RichText(
                  text: const TextSpan(
                    text: 'Forgot Password? ',
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Click here',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _login() async {
    final userId = _usernameController.text;
    final password = _passwordController.text;

    final response = await http.post(
      Uri.parse('http://localhost:3000/login'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'userId': userId,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CardsPage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid User ID or Password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC2D7F1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: LoginForm(
            formKey: _formKey,
            usernameController: _usernameController,
            passwordController: _passwordController,
            onLogin: _login,
          ),
        ),
      ),
    );
  }
}

// Widget for changing the password
class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC2D7F1),
      appBar: AppBar(
        title: const Text('Change Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'New Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your new password';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Confirm New Password'),
                validator: (value) {
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Password changed successfully')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

