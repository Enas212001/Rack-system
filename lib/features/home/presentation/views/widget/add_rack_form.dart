import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/func/custom_toast.dart';
import 'package:flutter_application_1/features/auth/presentation/views/widgets/title_with_textfield.dart';
import 'package:flutter_application_1/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_full_button.dart';

class AddRackForm extends StatelessWidget {
  const AddRackForm({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is AddRackSuccess) {
          showToast('Rack added successfully');
          homeCubit.getRacksInfo();
          Navigator.pop(context);
        } else if (state is AddRackFailure) {
          log(state.message);
          showToast('Failed to add rack');
        } else if (state is AddRackLoading) {
          showToast('Loading...');
        }
      },
      builder: (context, state) {
        return Form(
          key: homeCubit.formAddRackKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Add New Rack', style: CustomTextStyles.text20Bold),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: homeCubit.selectedSwitchId,
                  decoration: InputDecoration(
                    labelText: 'Switch ID',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  items: homeCubit.switchIds.map((id) {
                    return DropdownMenuItem(value: id, child: Text(id));
                  }).toList(),
                  onChanged: (value) {
                    homeCubit.selectedSwitchId = value;
                  },
                  validator: (value) => value == null ? 'Required' : null,
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: homeCubit.selectedBuildingId,
                  decoration: InputDecoration(
                    labelText: 'Building Rack ID',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 16,
                    ),
                  ),
                  items: homeCubit.buildingRackIds.map((id) {
                    return DropdownMenuItem(value: id, child: Text(id));
                  }).toList(),
                  onChanged: (value) {
                    homeCubit.selectedBuildingId = value;
                  },
                  validator: (value) => value == null ? 'Required' : null,
                ),
                SizedBox(height: 10),
                TitleWithTextField(
                  title: 'Product Panel',
                  controller: homeCubit.productPanelController,
                  hintText: 'Enter Product Panel',
                ),
                SizedBox(height: 10),
                TitleWithTextField(
                  title: 'Product Serial',
                  controller: homeCubit.productSerialController,
                  hintText: 'Enter Product Serial',
                ),
                SizedBox(height: 10),
                TitleWithTextField(
                  title: 'Product Mac',
                  controller: homeCubit.productMacController,
                  hintText: 'Enter Product Mac',
                ),
                SizedBox(height: 10),
                TitleWithTextField(
                  title: 'ProductModel',
                  controller: homeCubit.productModelController,
                  hintText: 'Enter ProductModel',
                ),
                SizedBox(height: 10),
                TitleWithTextField(
                  title: 'Product Port',
                  controller: homeCubit.productPortController,
                  hintText: 'Enter Product Port',
                ),
                SizedBox(height: 10),
                TitleWithTextField(
                  title: 'Device Name',
                  controller: homeCubit.deviceNameController,
                  hintText: 'Enter Device Name',
                ),
                SizedBox(height: 10),
                TitleWithTextField(
                  title: 'Site Name',
                  controller: homeCubit.siteNameController,
                  hintText: 'Enter Site Name',
                ),
                SizedBox(height: 10),
                AddFullSizeButton(
                  onPressed: () {
                    if (homeCubit.formAddRackKey.currentState!.validate()) {
                      homeCubit.addRack();
                    }
                  },
                  text: 'Add Rack',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
