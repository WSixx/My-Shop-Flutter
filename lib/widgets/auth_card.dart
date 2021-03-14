import 'package:flutter/material.dart';

enum AuthMode { SignUp, Login }

class AuthCard extends StatefulWidget {
  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  GlobalKey<FormState> _form = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  bool _isLoading = false;
  final TextEditingController _passwordController = TextEditingController();

  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  void _submit() {
    if (!_form.currentState.validate()) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    _form.currentState.save();
    if (_authMode == AuthMode.Login) {
      //Login
    } else {
      //Regi
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.SignUp;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        height: _authMode == AuthMode.Login ? 300 : 380,
        width: deviceSize.width * 0.75,
        padding: EdgeInsets.all(16),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty || !value.contains('@')) {
                    return 'Informe um email Válido';
                  }
                  return null;
                },
                onSaved: (value) => _authData['email'] = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                controller: _passwordController,
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty || value.length < 5) {
                    return 'Informe uma senha Válido';
                  }
                  return null;
                },
                onSaved: (value) => _authData['password'] = value,
              ),
              if (_authMode == AuthMode.SignUp)
                TextFormField(
                  decoration: InputDecoration(labelText: 'Confirmar Password'),
                  obscureText: true,
                  validator: _authMode == AuthMode.SignUp
                      ? (value) {
                          if (value != _passwordController.text) {
                            return 'Informe senhas iguais';
                          }
                          return null;
                        }
                      : null,
                ),
              Spacer(),
              _isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ElevatedButton(
                      onPressed: _submit,
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                        primary: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        _authMode == AuthMode.Login ? 'Logar' : 'Registrar',
                        style: TextStyle(
                            color: Theme.of(context)
                                .primaryTextTheme
                                .button
                                .color),
                      ),
                    ),
              TextButton(
                onPressed: _switchAuthMode,
                child: Text(
                  _authMode == AuthMode.Login ? 'REGISTRAR' : 'LOGAR',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
