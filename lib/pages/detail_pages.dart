import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app_poc_assign/consts/colors.dart';
import 'package:movie_app_poc_assign/consts/dimens.dart';
import 'package:movie_app_poc_assign/widgets/cached_network_image_widget.dart';
import 'package:movie_app_poc_assign/widgets/chip_movie_genre.dart';
import 'package:movie_app_poc_assign/widgets/easy_text_widget.dart';

import 'home_page.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kSecondaryColor,
      body: DetailPageSliverSection(
        movieURL:
            'https://images.saymedia-content.com/.image/ar_4:3%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:eco%2Cw_1200/MTkxMzMxMTMxNzc2ODM3MjE4/anime-review-grand-blue2018.jpg',
        movieTitle: 'Grand Blue : Grand Blue Dreaming',
        movieVote: '3000 Votes',
        movieRating: '7.99',
        movieRLSDate: '2017',
      ),
    );
  }
}

class DetailPageSliverSection extends StatelessWidget {
  const DetailPageSliverSection({
    Key? key,
    required this.movieRLSDate,
    required this.movieVote,
    required this.movieRating,
    required this.movieTitle,
    required this.movieURL,
  }) : super(key: key);
  final String movieRLSDate;
  final String movieVote;
  final String movieRating;
  final String movieTitle;
  final String movieURL;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        // floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            [
              SliverAppBar(
                  actions: const [
                    Padding(
                      padding: EdgeInsets.only(right: kPS10x),
                      child: Icon(
                        Icons.search,
                        size: kIconSize30x,
                      ),
                    )
                  ],
                  //  floating: true,
                  // pinned: true,
                  backgroundColor: Colors.transparent,
                  expandedHeight: kSliverHeight,
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: const EdgeInsets.only(left: kPS10x),
                    // collapseMode: CollapseMode.pin,
                    title: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Chip(
                                backgroundColor: kAmberColor,
                                label: EasyTextWidget(
                                  text: movieRLSDate,
                                  fontSize: kFontSize10x,
                                  fontWeight: FontWeight.w600,
                                )),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    RatingBar.builder(
                                      initialRating: 3,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 1.0),
                                      itemSize: 10,
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                    EasyTextWidget(
                                      text: movieVote,
                                      fontSize: kFontSize10x,
                                      color: kGreyColor,
                                    )
                                  ],
                                ),
                                EasyTextWidget(
                                  text: movieRating,
                                  fontSize: kFontSize20x,
                                  fontWeight: FontWeight.w600,
                                )
                              ],
                            )
                          ],
                        ),
                        EasyTextWidget(
                            text: movieTitle,
                            fontSize: kFontSize20x,
                            fontWeight: FontWeight.w600),
                      ],
                    ),
                    background: CachedNetworkImageWidget(
                        imageUrl: movieURL, fit: BoxFit.cover),
                  )),
            ],
        body: ListView(children: const [
          MovieDetail(),
          ActorSection(
            titleName: 'Best Actor',
            sideTitleName: 'More Actor',
            itemCount: 10,
            artistPhotoURL:
                'https://cdn.myanimelist.net/images/characters/10/387495.jpg',
            artistName: 'Iori Kitahara',
          ),
          AboutFilmDescri(
            originalTitle: 'Grand Blue',
            type: 'Comedy Slice of life ,Comedy ,Romantic',
            production:
                'The anime series is written and directed by Shinji Takamatsu, with Takamatsu also handling sound direction, Zero-G producing the animation and Hideoki Kusama designing the characters.',
            premiere: 'July 2018',
            description:
                'A college student spends his year at the seaside town of Izu, having fun on the beach with his school friends. A college student spends his year at the seaside town of Izu, having fun on the beach with his school friends.',
          ),
          ActorSection(
            titleName: 'Creators',
            sideTitleName: 'More Creators',
            itemCount: 10,
            artistPhotoURL:
                'https://static.wikia.nocookie.net/naruto/images/a/a3/Masashi_Kishimoto_2014.png',
            artistName: 'Masashi Kishimoto',
          ),
          MovieSection(
            titleName: "Related Movies",
            movieURL:
                'https://image.tmdb.org/t/p/original/bAQ8O5Uw6FedtlCbJTutenzPVKd.jpg',
            movieName: 'The Last : Naruto Movie(2014)',
            movieRating: '7.6',
          ),
        ]));
  }
}

class AboutFilmDescri extends StatelessWidget {
  const AboutFilmDescri({
    Key? key,
    required this.originalTitle,
    required this.type,
    required this.production,
    required this.premiere,
    required this.description,
  }) : super(key: key);
  final String originalTitle;
  final String type;
  final String production;
  final String premiere;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(kPS10x),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const EasyTextWidget(
                text: "ABOUT FILM",
                fontSize: kFontSize20x,
                fontWeight: FontWeight.w600,
                color: kGreyColor,
              ),
              const SizedBox(
                height: kPS10x,
              ),
              Column(
                children: [
                  AboutFilmDescription(
                    descrTitle: 'Original Title',
                    description: originalTitle,
                  ),
                  const SizedBox(
                    height: kPS10x,
                  ),
                  AboutFilmDescription(
                    descrTitle: 'Type',
                    description: type,
                  ),
                  const SizedBox(
                    height: kPS10x,
                  ),
                  AboutFilmDescription(
                    descrTitle: 'Production',
                    description: production,
                  ),
                  const SizedBox(
                    height: kPS10x,
                  ),
                  AboutFilmDescription(
                    descrTitle: 'Premiere',
                    description: premiere,
                  ),
                  const SizedBox(
                    height: kPS10x,
                  ),
                  AboutFilmDescription(
                      descrTitle: 'Description ', description: description),
                  const SizedBox(
                    height: kPS10x,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AboutFilmDescription extends StatelessWidget {
  const AboutFilmDescription({
    Key? key,
    required this.descrTitle,
    this.description = '-',
  }) : super(key: key);
  final String descrTitle;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: EasyTextWidget(
            text: descrTitle,
            fontWeight: FontWeight.w600,
            color: kAboutFilm,
          ),
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: EasyTextWidget(
              text: description,
              fontWeight: FontWeight.w600,
            ))
      ],
    );
  }
}

class MovieDetail extends StatelessWidget {
  const MovieDetail({
    Key? key,
  }) : super(key: key);

/*final String movieRuntime;
final String movieRuntime;*/

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding:
            const EdgeInsets.only(left: kPS10x, bottom: kPS10x, right: kPS10x),
        child: SizedBox(
          width: double.infinity,

          //height: kSectionHeight250x,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: kPS5x,
                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  Icon(
                    Icons.access_time,
                    color: kAmberColor,
                    size: kIconSize20x,
                  ),
                  EasyTextWidget(text: '3hr 12mins', fontSize: kFontSize16x),
                  ChipMovieGenre(
                      movieGenre: 'Comedy Slice of life',
                      fontSize: kFontSize14x,
                      fontWeight: FontWeight.w600,
                      backGroundColor: kGreyColor),
                  ChipMovieGenre(
                      movieGenre: 'Romantic',
                      fontSize: kFontSize14x,
                      fontWeight: FontWeight.w600,
                      backGroundColor: kGreyColor),
                ],
              ),
              const Icon(
                Icons.favorite_border,
                size: kIconSize20x,
                color: kWhiteColor,
              ),
              const SizedBox(
                height: kPS10x,
              ),
              const EasyTextWidget(
                text: 'Story Line',
                fontSize: kFontSize14x,
                color: kGreyColor,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: kPS10x,
              ),
              const EasyTextWidget(
                text:
                    'A college student spends his year at the seaside town of Izu, having fun on the beach with his school friends. A college student spends his year at the seaside town of Izu, having fun on the beach with his school friends.',
                fontSize: kFontSize16x,
                fontWeight: FontWeight.w600,
              ),
              Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Chip(
                      backgroundColor: kAmberColor,
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.play_circle_outline,
                            size: kPlayButtonSize30x,
                            color: kGreyColor,
                          ),
                          EasyTextWidget(
                            text: "PLAY TRAILER",
                            fontSize: kFontSize16x,
                            fontWeight: FontWeight.w600,
                          )
                        ],
                      )),
                  Chip(
                    side: const BorderSide(
                      color: kWhiteColor,
                      width: 2,
                    ),
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.star,
                          size: kPlayButtonSize30x,
                          color: kAmberColor,
                        ),
                        EasyTextWidget(
                          text: "RATE Movie",
                          fontSize: kFontSize16x,
                          fontWeight: FontWeight.w600,
                        )
                      ],
                    ),
                    backgroundColor: kSecondaryColor,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
