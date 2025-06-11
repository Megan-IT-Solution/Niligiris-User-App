import 'package:flutter/material.dart';
import 'package:nilgiris/controllers/switch_controller.dart';
import 'package:nilgiris/widgets/text_inputs.dart';
import 'package:provider/provider.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_text_styles.dart';
import '../../../../widgets/buttons.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        title: Text("Add Address", style: AppTextStyles.h2),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              CustomTextInput(
                hintText: "Name",
                prefixIcon: Icons.drive_file_rename_outline,
              ),
              SizedBox(height: 20),
              CustomTextInput(
                hintText: "Address",
                prefixIcon: Icons.location_on_outlined,
              ),
              SizedBox(height: 20),

              CustomTextInput(
                hintText: "City",
                prefixIcon: Icons.location_city,
              ),
              SizedBox(height: 20),

              CustomTextInput(
                hintText: "Phone Number",
                prefixIcon: Icons.phone,
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 20),

              Consumer<SwitchController>(
                builder: (context, switchController, child) {
                  return SwitchListTile(
                    hoverColor: Colors.transparent,
                    activeColor: AppColors.primaryColor,
                    value: switchController.isSwitchActive,
                    onChanged: (v) {
                      switchController.makeSwitchActiveOrInActive(v);
                    },
                    title: Text(
                      "Make Default",
                      style: AppTextStyles.h1.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),

              SizedBox(height: 60),
              PrimaryButton(title: "Save Address"),
            ],
          ),
        ),
      ),
    );
  }
}
