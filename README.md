MaterialApp(
  routes: {
    '/': (context) => HomePage(),
    '/login': (context) => Provider<AuthenticationBloc>(
      builder: (context) => AuthenticationBloc(),
      dispose: (context, value) => value.dispose()
      child: LoginPage(),
    ),
    '/login/register': (context) => EmailRegisterPage(),
  }
)
