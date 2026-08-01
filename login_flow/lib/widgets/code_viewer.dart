import 'package:flutter/material.dart';

class CodeViewer extends StatelessWidget {

  const CodeViewer({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(

      width: double.infinity,

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(

        color: Colors.black87,

        borderRadius: BorderRadius.circular(24),

      ),

      child: const SelectableText(

        '''
{
   "success": true,
   "statusCode": 200,
   "message": "Login Successful",
   "token":
   "eyJhbGciOiJIUzI1NiIs...",

   "user":{

      "id":101,

      "username":"student",

      "role":"Flutter Developer",

      "department":"Mobile Engineering"

   }

}
''',

        style: TextStyle(

          color: Colors.greenAccent,

          fontFamily: "monospace",

          fontSize: 15,

        ),

      ),

    );

  }

}