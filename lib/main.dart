import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: LoginScreen()));
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  String? _notNullValidator(value) {
    if (value.isEmpty) {
      return "field cant be empty";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _userNameFocusNode = FocusNode();
    final _passwordFocusNode = FocusNode();
    final _formGlobalKey = GlobalKey<FormState>();
    var formMap = {};
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Form(
              key: _formGlobalKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login to the WaterAware!",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('We are happy to see you again'),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      validator: _notNullValidator,
                      onSaved: (newValue) => formMap["userName"] = newValue,
                      focusNode: _userNameFocusNode,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(_passwordFocusNode);
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.5),
                        labelText: "Username",
                        labelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      validator: _notNullValidator,
                      onSaved: (newValue) => formMap["password"] = newValue,
                      onTap: () {
                        FocusScope.of(context).requestFocus(_passwordFocusNode);
                      },
                      focusNode: _passwordFocusNode,
                      onFieldSubmitted: (value) {},
                      obscureText: true,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.remove_red_eye),
                        prefixIcon: Icon(Icons.lock),
                        filled: true,
                        labelText: "Password",
                        labelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(205.0, 0, 0, 0),
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(color: Colors.black,
                            fontSize: 12
                            ),
                          
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 250,
                      height: 50,
                      child: Container(
                          height: 44.0,
                          
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                              gradient: LinearGradient(colors: [
                            Color.fromARGB(255, 2, 173, 102),
                            Colors.blue
                            //Color.fromRGBO(45, 138, 224, 100),
                            //Color.fromRGBO(125, 81, 217, 100),
                          ])),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent),
                            child: Text('Login'),
                          ),
                        ),
                      ),

                    SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                        width: 250,
                        // height: 50,
                        child: Center(
                          child: Text("Or login with"),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0,0,80.0,0),
                        child: TextButton.icon(onPressed: (){}, icon: Icon(Icons.facebook), label: Text('Facebook'), 
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                        primary: Colors.blue,
                        side: BorderSide(
                          color: Colors.blue,
                          width: 0.1
                        )
                      )),
                      ),
                      TextButton.icon(onPressed: (){}, icon: Icon(Icons.chrome_reader_mode), label: Text('Google'),
                      
                      style: TextButton.styleFrom(
                        
                        backgroundColor: Colors.grey[200],
                        primary: Colors.blue,
                        side: BorderSide(
                          color: Colors.blue,
                          width: 0.1
                        )
                      ),)
                    ],),
                    SizedBox(height: 40,),
                    Text("Don't have an Account?"),
                    TextButton(onPressed: (){}, child: Text('Sign Up',
                    style: TextStyle(
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                    ),))
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
