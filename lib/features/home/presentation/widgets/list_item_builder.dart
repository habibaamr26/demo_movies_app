import 'package:flutter/material.dart';
import 'package:week6_task/core/constant/images.dart';
import 'package:week6_task/core/constant/text_style.dart';
import 'package:week6_task/features/home/data/models/home_data_response_model.dart';
import 'package:week6_task/features/home/presentation/movie_details_screen.dart';

class ListItemBuilder extends StatelessWidget {
  HomeDataResultModel item;
  ListItemBuilder({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Hero(
              tag: item.id!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  item.backdropPath != null
                      ? 'https://image.tmdb.org/t/p/w500${item.backdropPath}'
                      : Images.jerry,
                  width: 90,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.title!, style: TextStyles.textStyleBold15(context)),
                  const SizedBox(height: 5.0),
                  Text("⭐ ${item.voteAverage.round()} /10"),
                  const SizedBox(height: 10.0),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    child: Text("Action"),
                  ),
                ],
              ),
            ),

            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MovieDetailsScreen(item: item),
                  ),
                );
              },
              icon: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
