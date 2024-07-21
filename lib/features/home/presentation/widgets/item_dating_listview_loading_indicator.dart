import 'package:flutter/material.dart';

class ListViewItemLoadingIndicator extends StatelessWidget {
  const ListViewItemLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: AspectRatio(
        aspectRatio: 3 / 1.6,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.40,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //title
                      Container(
                        color: Colors.grey,
                        height: 10,
                        width: double.infinity,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //description
                      Container(
                        color: Colors.grey,
                        height: 30,
                        width: double.infinity,
                      ),

                      const Spacer(),
                      //icons (likes)
                      Container(
                        height: 20,
                        color: Colors.grey,
                        width: double.infinity,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: Container(
                            color: Colors.grey,
                            height: 15,
                          )),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.grey,
                              height: 15,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
