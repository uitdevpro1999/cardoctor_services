
import 'package:flutter/material.dart';

import '../../gen/colors.gen.dart';
import 'buttons/primary_button.dart';
import 'buttons/secondary_button.dart';

class CarDoctorDialog extends StatelessWidget {
  final String? content;
  final VoidCallback onRejectButtonClicked;
  final VoidCallback onAgreeButtonClick;

  const CarDoctorDialog({
    Key? key,
    this.content,
    required this.onRejectButtonClicked,
    required this.onAgreeButtonClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 40),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        content!,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: ColorName.textGray2,
                        ),
                      ),
                    ),
                    SizedBox(height: 32),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: SecondaryButton(
                              onTap: () {
                                onRejectButtonClicked.call();
                              },
                              title: 'Từ chối',
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: PrimaryButton(
                              onTap: (){
                                onAgreeButtonClick.call();
                              },
                              title: 'Đồng ý',
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(height: 8.h),
                  ],
                ),
                Positioned(
                  right: 0,
                  child: Material(
                    color: Colors.transparent,
                    child: IconButton(
                      onPressed: Navigator.of(context).pop,
                      icon: Icon(Icons.cancel_outlined, color: Colors.grey, size: 24),
                    ),
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
}
