import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/func/custom_toast.dart';
import 'package:flutter_application_1/core/utils/widgets/custom_loading.dart';
import 'package:flutter_application_1/features/auth/presentation/views/widgets/title_with_textfield.dart';
import 'package:flutter_application_1/features/home/Racks/cubit/rack_cubit.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widget/add_full_button.dart';

class AddRackForm extends StatelessWidget {
  const AddRackForm({super.key, required this.buildingRId});
  final String buildingRId;
  @override
  Widget build(BuildContext context) {
    RackCubit rackCubit = BlocProvider.of<RackCubit>(context);
    return BlocConsumer<RackCubit, RackState>(
      listener: (context, state) {
        if (state is AddRackSuccess) {
          showToast('Rack added successfully');
          rackCubit.getRacksInfo(buildingRId: buildingRId);
          Navigator.pop(context);
        } else if (state is AddRackFailure) {
          log(state.message);
          showToast('Failed to add rack');
        } else if (state is AddRackLoading) {
          CustomLoading();
        }
      },
      builder: (context, state) {
        return Form(
          key: rackCubit.formAddRackKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Add New Rack', style: CustomTextStyles.text20Bold),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: rackCubit.selectedSwitchId,
                  decoration: InputDecoration(
                    labelText: 'Switch ID',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  items: rackCubit.switchIds.map((id) {
                    return DropdownMenuItem(value: id, child: Text(id));
                  }).toList(),
                  onChanged: (value) {
                    rackCubit.selectedSwitchId = value;
                  },
                  validator: (value) => value == null ? 'Required' : null,
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: rackCubit.selectedBuildingId,
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
                  items: rackCubit.buildingRackIds.map((id) {
                    return DropdownMenuItem(value: id, child: Text(id));
                  }).toList(),
                  onChanged: (value) {
                    rackCubit.selectedBuildingId = value;
                  },
                  validator: (value) => value == null ? 'Required' : null,
                ),
                SizedBox(height: 10),
                TitleWithTextField(
                  title: 'Product Panel',
                  controller: rackCubit.productPanelController,
                  hintText: 'Enter Product Panel',
                ),
                SizedBox(height: 10),
                TitleWithTextField(
                  title: 'Product Serial',
                  controller: rackCubit.productSerialController,
                  hintText: 'Enter Product Serial',
                ),
                SizedBox(height: 10),
                TitleWithTextField(
                  title: 'Product Mac',
                  controller: rackCubit.productMacController,
                  hintText: 'Enter Product Mac',
                ),
                SizedBox(height: 10),
                TitleWithTextField(
                  title: 'ProductModel',
                  controller: rackCubit.productModelController,
                  hintText: 'Enter ProductModel',
                ),
                SizedBox(height: 10),
                TitleWithTextField(
                  title: 'Product Port',
                  controller: rackCubit.productPortController,
                  hintText: 'Enter Product Port',
                ),
                SizedBox(height: 10),
                TitleWithTextField(
                  title: 'Device Name',
                  controller: rackCubit.deviceNameController,
                  hintText: 'Enter Device Name',
                ),
                SizedBox(height: 10),
                TitleWithTextField(
                  title: 'Site Name',
                  controller: rackCubit.siteNameController,
                  hintText: 'Enter Site Name',
                ),
                SizedBox(height: 10),
                AddFullSizeButton(
                  onPressed: () {
                    if (rackCubit.formAddRackKey.currentState!.validate()) {
                      rackCubit.addRack();
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
