import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/app_constants.dart';
import '../../utils/validators.dart';
import '../../viewmodels/api_viewmodel.dart';
import '../../widgets/api_card.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/method_chip.dart';
import '../../widgets/request_box.dart';
import '../../widgets/section_title.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ApiViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "API Tester Pro",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: vm.clear,
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: Form(
          key: vm.formKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              _buildHeader(),

              const SizedBox(height: 30),

              const SectionTitle(title: "API Endpoint"),

              TextFormField(
                controller: vm.urlController,
                validator: Validators.url,
                keyboardType: TextInputType.url,
                decoration: const InputDecoration(
                  hintText: "https://jsonplaceholder.typicode.com/posts",
                  prefixIcon: Icon(Icons.link),
                ),
              ),

              const SizedBox(height: 30),

              const SectionTitle(title: "HTTP Method"),

              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: AppConstants.methods.map((method) {
                  return MethodChip(
                    method: method,
                    selected: vm.selectedMethod == method,
                    onTap: () => vm.changeMethod(method),
                  );
                }).toList(),
              ),

              const SizedBox(height: 30),

              const SectionTitle(
                title: "Request Headers (JSON)",
                subtitle: "Optional HTTP headers",
                icon: Icons.http_rounded,
                color: Colors.deepPurple,
              ),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF312E81),
                      Color(0xFF1E3A8A),
                    ],
                  ),

                  borderRadius: BorderRadius.circular(24),

                  border: Border.all(
                    color: const Color(0xFF38BDF8),
                    width: 1.6,
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF38BDF8).withOpacity(.30),
                      blurRadius: 22,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: RequestBox(
                  controller: vm.headerController,
                  hint: '''
{
  "Content-Type":"application/json"
}
''',
                ),
              ),

              const SizedBox(height: 30),

              const SectionTitle(
                title: "Request Body (JSON)",
                subtitle: "JSON payload",
                icon: Icons.data_object_rounded,
                color: Colors.orange,
              ),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF312E81),
                      Color(0xFF1E3A8A),
                    ],
                  ),

                  borderRadius: BorderRadius.circular(24),

                  border: Border.all(
                    color: const Color(0xFF38BDF8),
                    width: 1.6,
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF38BDF8).withOpacity(.30),
                      blurRadius: 22,
                      spreadRadius: 1,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),

                child: RequestBox(
                  controller: vm.bodyController,
                  hint: '''
{
  "title":"Flutter",
  "body":"API Testing",
  "userId":1
}
''',
                  lines: 8,
                ),
              ),

              const SizedBox(height: 35),

              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: "Send Request",
                      icon: Icons.send_rounded,
                      loading: vm.isLoading,
                      onPressed: () {
                        vm.sendRequest(context);
                      },
                    ),
                  ),

                  const SizedBox(width: 12),

                  SizedBox(
                    width: 60,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: vm.clear,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Icon(Icons.delete_outline_rounded),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 35),
              const SectionTitle(title: "Recent Requests"),

              if (vm.history.isEmpty)
                Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: const Column(
                    children: [
                      Icon(Icons.history, size: 55, color: Colors.grey),

                      SizedBox(height: 12),

                      Text(
                        "No Requests Yet",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 6),

                      Text(
                        "Your recent API requests will appear here.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),

              if (vm.history.isNotEmpty)
                ...vm.history.map((item) => ApiCard(history: item)),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildHeader() {
  return Container(
    padding: const EdgeInsets.all(22),
    decoration: BoxDecoration(
      color: Colors.blue.shade50,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(Icons.api_rounded, color: Colors.white, size: 32),
        ),
        const SizedBox(width: 18),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "REST API Tester",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                "Test GET, POST, PUT, PATCH & DELETE requests.",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
