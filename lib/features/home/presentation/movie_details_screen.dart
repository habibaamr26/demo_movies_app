import 'package:flutter/material.dart';
import 'package:week6_task/core/constant/images.dart';
import 'package:week6_task/core/constant/text_style.dart';
import 'package:week6_task/features/home/data/models/home_data_response_model.dart';

class MovieDetailsScreen extends StatelessWidget {
  HomeDataResultModel item;
  MovieDetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title!, style: TextStyles.textStyleBold25(context)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: item.id,
                child: Image(
                  image: item.backdropPath != null
                      ? NetworkImage(
                          'https://image.tmdb.org/t/p/w500${item.backdropPath}',
                        )
                      : AssetImage(Images.jerry) as ImageProvider,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Text(
                  "⭐ ${item.voteAverage.round()} / 10",
                  style: TextStyles.textStyleSemiBold20(context),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Text(
                  "Description",
                  style: TextStyles.textStyleBold25(context),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  item.overview ?? "No description available.",
                  style: TextStyles.textStyleRegular15Black(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
