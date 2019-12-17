// import 'package:flutter/material.dart';

// class ImageBanner extends StatelessWidget {
//   final String _assetPath;

//   ImageBanner(this._assetPath); //positional parameter to the constructor

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       constraints: BoxConstraints.expand(
//         height: 200.0,
//       ),
//       decoration: BoxDecoration(color: Colors.grey),//incase if the image doesnot load
//       child: Image.asset(
//         _assetPath,
//         fit: BoxFit.cover,
//       ),
//     );
//   }
// }