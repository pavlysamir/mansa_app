import 'package:flutter/material.dart';
import 'package:mansa_app/constants.dart';

class SelectedDropDownItem extends StatefulWidget {
  const SelectedDropDownItem({
    super.key,
    required this.index,
    required this.functionSelected,
    required this.name,
  });

  final int index;
  final Function() functionSelected;
  final String name;

  @override
  State<SelectedDropDownItem> createState() => _CreatePostPlatFormItemState();
}

class _CreatePostPlatFormItemState extends State<SelectedDropDownItem> {
  bool initialValue = false;
  bool initialValue2 = false;

  //late AddPostCubit addPostCubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Access the AddPostCubit and store the reference
    // addPostCubit = AddPostCubit.get(context);
  }

  @override
  void dispose() {
    // Safely use the stored reference
    // addPostCubit.checkBoxValues.clear();
    // addPostCubit.selectedInstaItems.clear();
    // addPostCubit.selectedaceInstaItems.clear();
    // addPostCubit.selectedItems.clear();
    // //addPostCubit.addPostController.text = '';
    // addPostCubit.postImages.clear();
    // addPostCubit.fileVideo = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 3,
          child: Text(
            widget.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        Expanded(
          flex: 1,
          child: StatefulBuilder(
            builder: (context, setState) {
              return Checkbox(
                checkColor: Colors.white,
                activeColor: kPrimaryKey,
                value: initialValue,
                onChanged: (value) {
                  setState(() {
                    initialValue = value!;
                    widget.functionSelected();

                    // if (value) {
                    // addPostCubit.selectedInstaItems
                    //     .add(addPostCubit.platformNames[widget.indrx]);
                    // addPostCubit.checkBoxValues[addPostCubit
                    //     .platformNames[widget.indrx]] = value;
                    // print(addPostCubit.checkBoxValues);
                    // print(addPostCubit.selectedItems);
                    //  } else {
                    // addPostCubit.selectedInstaItems.remove(
                    //     addPostCubit.platformNames[widget.indrx]);
                    // print(addPostCubit.selectedInstaItems);
                    // addPostCubit.selectedInstaItems.remove(
                    //     addPostCubit.checkBoxValues[addPostCubit
                    //         .platformNames[widget.indrx]] = value);
                    // print(addPostCubit.selectedInstaItems);
                    //  }
                  });
                },
              );
            },
          ),
        )
      ],
    );
  }
}
