// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// // ignore: camel_case_types
// class createAccount extends StatelessWidget {
//   _LoginState createState() => LoginState();
// }

// class LoginState extends State<createAccount> with ValidationMixin {
//   final FormState formkey_c = FormState();
//   TextEditingController emailController_c = TextEditingController();
//   TextEditingController passwordController_c = TextEditingController();

//   @override
//   Widget build(BuildContext contextCreate) {
//     final Size size = MediaQuery.of(contextCreate).size;
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Create Account'),
//         ),
//         body: Stack(
//           alignment: Alignment.center,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 logoImage_c(),
//                 Stack(
//                   children: [inputForm_c(size), authButton_c(size)],
//                 ),
//                 Container(
//                   height: size.height * 0.1,
//                 ),
//               ],
//             )
//           ],
//         )

//         // Center(
//         //   child: OutlinedButton(
//         //     child: Text('Go to the First Page'),
//         //     onPressed: () {
//         //       Navigator.pop(contextCreate);
//         //     },
//         //   ),
//         // ),
//         // backgroundColor: Colors.yellow[200],
//         );
//   }
// }
// //       Container(
// //         height: size.height * 0.1,
// //       ),
// //       TextButton(
// //           onPressed: () {
// //             Navigator.push(context,
// //                 MaterialPageRoute(builder: (context) => createAccount()));
// //           },
// //           child: Text("Don't have an account? Create One!")),
// //       Container(
// //         height: size.height * 0.05,
// //       ),
// //     ],
// //   ),
// // ]),

// Widget logoImage_c() => Expanded(
//       child: Padding(
//         padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
//         child: FittedBox(
//           fit: BoxFit.contain,
//           child: CircleAvatar(
//             backgroundImage: NetworkImage('https://picsum.photos/200'),
//           ),
//         ),
//       ),
//     );

// Widget authButton_c(Size size) => Positioned(
//       left: size.width * 0.1,
//       right: size.width * 0.1,
//       bottom: 0,
//       child: SizedBox(
//         height: 50,
//         child: OutlinedButton(
//           style: OutlinedButton.styleFrom(
//               backgroundColor: Colors.blue,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(25.0))),
//           child: Text(
//             "Login",
//             style: new TextStyle(
//                 color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
//           ),
//           onPressed: () {
//             // if (_formkey.currentState!.validate()) {
//             //   print([
//             //     _emailController.text.toString(),
//             //     passwordController_c.text.toString()
//             //   ]);
//           },
//         ),
//       ),
//     );

// Widget inputForm_c(Size size) {
//   return Padding(
//     padding: EdgeInsets.all(size.width * 0.05),
//     child: Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       elevation: 6,
//       child: Padding(
//         padding:
//             const EdgeInsets.only(left: 12.0, right: 12, top: 12, bottom: 36),
//         child: Form(
//             key: formkey_c,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TextFormField(
//                   controller: _emailController,
//                   decoration: InputDecoration(
//                       icon: Icon(Icons.account_circle), labelText: "Email"),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please input correct Email';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   obscureText: true,
//                   controller: _passwordController,
//                   decoration: InputDecoration(
//                       icon: Icon(Icons.vpn_key), labelText: "Password"),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please input correct Password';
//                     }
//                     return null;
//                   },
//                 ),
//                 Container(
//                   height: 8.0,
//                 ),
//                 Text("Forgot Password")
//               ],
//             )),
//       ),
//     ),
//   );
// }
