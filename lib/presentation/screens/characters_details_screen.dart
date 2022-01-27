import 'package:breaking_bad_project/constants/my_colors.dart';
import 'package:breaking_bad_project/data/models/characters.dart';
import 'package:flutter/material.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;
  const CharacterDetailsScreen({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  characterInfo('Job : ', character.jobs.join(' / ')),
                  const Divider(
                    color: MyColors.myYellow,
                  ),
                  characterInfo(
                      'Appeared in : ', character.categoryForTwoSeries),
                  const Divider(
                    color: MyColors.myYellow,
                  ),
                  characterInfo(
                      'Seasons : ', character.appearanceOfSeasons.join(' / ')),
                  const Divider(
                    color: MyColors.myYellow,
                  ),
                  character.betterCallSaulAppearance.isEmpty
                      ? Container()
                      : characterInfo('Better call saul Seasons : ',
                          character.betterCallSaulAppearance.join(' / ')),
                  character.betterCallSaulAppearance.isEmpty
                      ? Container()
                      : const Divider(
                          color: MyColors.myYellow,
                        ),
                  characterInfo('Actor/Actress : ', character.actorName),
                  const Divider(
                    color: MyColors.myYellow,
                  ),
                ],
              ),
            ),
          ])),
        ],
      ),
    );
  }

  Widget characterInfo(
    String title,
    String value,
  ) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(children: [
        TextSpan(
            text: title,
            style: const TextStyle(
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            )),
        TextSpan(
            text: value,
            style: const TextStyle(
              color: MyColors.myWhite,
              fontSize: 16,
            )),
      ]),
    );
  }

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 500,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.nickName,
          style: const TextStyle(
            color: MyColors.myWhite,
          ),
        ),
        background: Hero(
          tag: character.charId,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
