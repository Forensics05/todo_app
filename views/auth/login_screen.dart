// Simplified Login UI with Google Sign-In
class LoginScreen extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Login with Google"),
          onPressed: () async {
            final user = await _authService.signInWithGoogle();
            if (user != null) {
              Navigator.pushReplacementNamed(context, '/home');
            }
          },
        ),
      ),
    );
  }
}
