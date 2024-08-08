import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/core/utils/widgets/custom_form_field.dart';
import 'package:mansa_app/features/search/presentation/managers/cubit/search_cubit.dart';
import '../../../../../../constants.dart';
import '../../../../../../core/utils/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  bool isFocused = false;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final searchCubit = BlocProvider.of<SearchCubit>(context);

    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: SizedBox(
            height: 50.h,
            width: MediaQuery.of(context).size.width,
            child: Form(
              key: formKey,
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'there is nothing';
                  }
                },
                controller: searchCubit.searchController,
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                onTap: () {
                  setState(() {
                    isFocused = true;
                  });
                },
                onFieldSubmitted: (String _) {
                  if (formKey.currentState!.validate()) {}
                },
                onChanged: (String _) {},
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
                  filled: true,
                  fillColor: Colors.grey[200],
                  enabledBorder: outlineInputBorder(context),
                  focusedBorder: outlineInputBorder(context),
                  hintText: AppLocalizations.of(context)!.searchByName,
                  hintStyle: Styles.textStyle14Blck.copyWith(
                    color: Colors.grey,
                  ),
                  prefixIcon: Opacity(
                    opacity: 0.8,
                    child: Icon(
                      Icons.search,
                      color: isFocused ? kPrimaryKey : Colors.grey,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
