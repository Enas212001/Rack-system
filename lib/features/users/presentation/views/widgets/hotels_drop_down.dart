import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/func/border_text_field.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/widget/custom_loading.dart';
import 'package:flutter_application_1/features/home/Hotels/data/models/hotel_model.dart';
import 'package:flutter_application_1/features/home/Hotels/presentation/cubit/hotel_cubit.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotelsDropDown extends StatelessWidget {
  const HotelsDropDown({super.key, this.value, this.onChanged});

  final HotelModel? value;
  final ValueChanged<HotelModel?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HotelCubit()..getHotels(),
      child: BlocBuilder<HotelCubit, HotelState>(
        builder: (context, state) {
          if (state is HotelSuccess) {
            final hotels = state.hotels;
            if (hotels.isEmpty) {
              return const SizedBox.shrink();
            }
            return Padding(
              padding: EdgeInsets.only(bottom: 14.h),
              child: DropdownSearch<HotelModel>(
                selectedItem: value,
                compareFn: (item, selected) => item.id == selected.id,
                items: (filter, _) {
                  if (filter.isEmpty) return hotels;
                  return hotels
                      .where(
                        (loc) => (loc.name ?? '').toLowerCase().contains(
                          filter.toLowerCase(),
                        ),
                      )
                      .toList();
                },
                itemAsString: (item) => item.name ?? '',
                decoratorProps: DropDownDecoratorProps(
                  decoration: InputDecoration(
                    labelText: 'Hotel',
                    border: borderTextField(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelStyle: CustomTextStyles.text14W500Primary,
                  ),
                ),
                popupProps: PopupProps.menu(
                  showSearchBox: true,
                  fit: FlexFit.loose,
                  searchFieldProps: TextFieldProps(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      enabled: true,
                      border: borderTextField(),
                      enabledBorder: borderTextField(),
                      focusedBorder: borderTextField(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                    ),
                  ),
                  constraints: BoxConstraints(),
                  menuProps: MenuProps(
                    backgroundColor: AppColors.scaffoldBackgroundColor,
                    elevation: 4,
                    shadowColor: Colors.black54,
                  ),
                ),
                onChanged: onChanged,
                validator: (value) =>
                    value == null ? 'Please select a hotel' : null,
              ),
            );
          } else if (state is HotelLoading) {
            return const CustomLoading();
          } else if (state is HotelFailure) {
            return const SizedBox.shrink();
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
