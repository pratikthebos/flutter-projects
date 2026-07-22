import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/response_viewmodel.dart';
import '../../widgets/response_card.dart';
import '../../widgets/status_badge.dart';

class ResponseScreen extends StatelessWidget {
const ResponseScreen({super.key});

@override
Widget build(BuildContext context) {
final vm = context.watch<ResponseViewModel>();
final response = vm.response;

return Scaffold(
appBar: AppBar(
title: const Text("API Response"),
),
body: response == null
? const Center(
child: Text(
"No Response Available",
style: TextStyle(
fontSize: 18,
fontWeight: FontWeight.bold,
),
),
)
: SingleChildScrollView(
padding: const EdgeInsets.all(20),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Container(
width: double.infinity,
padding: const EdgeInsets.all(20),
decoration: BoxDecoration(
color: response.success
? Colors.green.shade50
: Colors.red.shade50,
borderRadius: BorderRadius.circular(20),
),
child: Column(
children: [

StatusBadge(
statusCode: response.statusCode,
),

const SizedBox(height: 20),

Row(
children: [

Expanded(
child: _infoCard(
title: "Status",
value: response.statusCode.toString(),
icon: Icons.verified_rounded,
color: response.success
? Colors.green
: Colors.red,
),
),

const SizedBox(width: 12),

Expanded(
child: _infoCard(
title: "Response Time",
value: "${response.responseTime} ms",
icon: Icons.timer_outlined,
color: Colors.blue,
),
),

],
),

],
),
),

const SizedBox(height: 25),

const Text(
"Response Body",
style: TextStyle(
fontSize: 20,
fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 12),

  ResponseCard(
    body: response.body,
  ),

const SizedBox(height: 25),

Row(
children: [

Expanded(
child: ElevatedButton.icon(
onPressed: () {

ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text("Copy functionality coming next."),
),
);

},
icon: const Icon(Icons.copy_rounded),
label: const Text("Copy"),
),
),

const SizedBox(width: 15),

Expanded(
child: OutlinedButton.icon(
onPressed: () {

vm.clear();

Navigator.pop(context);

},
icon: const Icon(Icons.delete_outline),
label: const Text("Clear"),
),
),

],
),

const SizedBox(height: 30),

],
),
),
);
}
}

Widget _infoCard({
  required String title,
  required String value,
  required IconData icon,
  required Color color,
}) {
  return Container(
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(.15),
          blurRadius: 10,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: Column(
      children: [
        Icon(
          icon,
          color: color,
          size: 28,
        ),
        const SizedBox(height: 10),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            color: Colors.grey.shade600,
          ),
        ),
      ],
    ),
  );
}