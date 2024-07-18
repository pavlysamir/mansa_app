import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../constants.dart';
import '../../../../../../core/utils/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({Key? key, required this.context}) : super(key: key);
  final BuildContext context;
  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  bool isFocused = false;
  final TextEditingController searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 40.h,
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: formKey,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'there is nothing';
              }
            },
            controller: searchController,
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
              enabledBorder: outlineInputBorder(),
              focusedBorder: outlineInputBorder(),
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
  }
}

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.shade50),
    borderRadius: BorderRadius.circular(10),
  );
}
