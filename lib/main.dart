import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'signup_page.dart';

void main() {
  runApp(const Tasktugas());
}

class Tasktugas extends StatelessWidget {
  const Tasktugas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasktugas',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tasktugas',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,color: Colors.green),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title Text (Centered and Wrapped)
                Wrap(children: [ Center(
                  child: Text(
                    ' Welcome to Tasktugas ',
                    style: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Center(child: Text("Sign up or login below to manage your project, task, and productivity"))]

                ),
                const SizedBox(height: 20),

                // Row for Login and Sign Up Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(//flex: 3,
                      child: TextButton(
                        onPressed: () {
                          // Logic for Login Tab
                        },
                        child: const Text('Login',style: TextStyle(color: Colors.black),),
                      ),
                    ),
                    Expanded(//flex: 5,
                      child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()),
                        );
                      },
                      child: const Text('Sign Up',style: TextStyle(color: Colors.black),),
                    ),)
                  ],
                ),
                const SizedBox(height: 20),

                // Social Login Buttons with White Background and Black Text
                ElevatedButton.icon(
                  icon: const Icon(Icons.apple, color: Colors.black),
                  label: const Text(
                    'Login with Apple',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    //side: const BorderSide(color: Colors.black, width: 1),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  icon: const Icon(Icons.email, color: Colors.black),
                  label: const Text(
                    'Login with Google',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    //side: const BorderSide(color: Colors.black, width: 1),
                  ),
                ),
                const SizedBox(height: 20),
                const Center(child: Text('or continue with email')),
                const SizedBox(height: 10),

                // Form Fields with Validation
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Enter your email',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                              .hasMatch(value)) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Enter your password',
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(_isObscure
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ),
                        ),
                        obscureText: _isObscure,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Forgot Password Above Login Button
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Login Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Perform Login Logic Here
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Logging in...'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text('Login'),
                ),
                Center(child: Text('By signing up,you agree to our Terms of service and privacy Policy'),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
