import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_icons.dart';
import '../core/widgets/gradient_button.dart';
import '../viewmodels/visitor_viewmodel.dart';

class VisitorForm extends StatelessWidget {
  const VisitorForm({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<VisitorViewModel>(context);

    // Prefill demo data only once
    if (vm.nameController.text.isEmpty) {
      vm.nameController.text = "Rahul Sharma";
      vm.mobileController.text = "9876543210";
      vm.flatController.text = "B-402";
      vm.vehicleController.text = "MH12AB1234";
      vm.changePurpose("Guest");
    }

    return Column(
      children: [
        Center(
          child: Stack(
            children: [
              CircleAvatar(
                radius: 52,
                backgroundColor: AppColors.primary.withOpacity(.15),
                child: const Icon(
                  AppIcons.photo,
                  color: AppColors.primary,
                  size: 42,
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.primary,
                  child: const Icon(
                    Icons.add_a_photo,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 28),

        TextField(
          controller: vm.nameController,
          decoration: const InputDecoration(
            labelText: "Visitor Name",
            prefixIcon: Icon(AppIcons.visitor),
          ),
        ),

        const SizedBox(height: 18),

        TextField(
          controller: vm.mobileController,
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
            labelText: "Mobile Number",
            prefixIcon: Icon(AppIcons.mobile),
          ),
        ),

        const SizedBox(height: 18),

        TextField(
          controller: vm.flatController,
          decoration: const InputDecoration(
            labelText: "Flat Number",
            prefixIcon: Icon(AppIcons.flat),
          ),
        ),

        const SizedBox(height: 18),

        DropdownButtonFormField<String>(
          value: vm.purpose,
          dropdownColor: AppColors.surface,
          decoration: const InputDecoration(
            labelText: "Purpose",
            prefixIcon: Icon(Icons.category),
          ),
          items: vm.purposes.map((e) {
            return DropdownMenuItem<String>(
              value: e,
              child: Text(e),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              vm.changePurpose(value);
            }
          },
        ),

        const SizedBox(height: 18),

        TextField(
          controller: vm.vehicleController,
          decoration: const InputDecoration(
            labelText: "Vehicle Number",
            prefixIcon: Icon(Icons.directions_car),
          ),
        ),

        const SizedBox(height: 30),

        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white10),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                AppIcons.qr,
                size: 70,
                color: AppColors.primary,
              ),
              SizedBox(height: 12),
              Text(
                "Gate Pass Preview",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 28),

        GradientButton(
          title: "Generate Gate Pass",
          icon: AppIcons.pass,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Gate Pass Generated Successfully"),
              ),
            );
          },
        ),
      ],
    );
  }
}