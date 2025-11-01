import 'package:flutter/material.dart';
import 'package:week6_task/core/constant/images.dart';
import 'package:week6_task/core/constant/text_style.dart';

class HomeBigImageStack extends StatelessWidget {
  const HomeBigImageStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      Images.networkImage,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned(
                    bottom: 30,
                    right: 30,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.pause, color: Colors.black),
                    ),
                  ),

                  Positioned(
                    bottom: 40,
                    left: 30,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text("Action", style: TextStyles.textStyleRegular15(context)),
                    ),
                  ),
                ],
              );
  }
}