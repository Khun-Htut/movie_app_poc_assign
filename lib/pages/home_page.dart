import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app_poc_assign/consts/colors.dart';
import 'package:movie_app_poc_assign/consts/dimens.dart';
import 'package:movie_app_poc_assign/consts/strings.dart';
import 'package:movie_app_poc_assign/pages/detail_pages.dart';
import 'package:movie_app_poc_assign/widgets/cached_network_image_widget.dart';
import 'package:movie_app_poc_assign/widgets/easy_text_widget.dart';
import 'package:movie_app_poc_assign/widgets/icon_button_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kSecondaryColor,
        appBar: AppBar(
          title: const EasyTextWidget(
            text: 'Discover',
            fontSize: kFontSize20x,
            fontWeight: FontWeight.w600,
          ),
          elevation: 0,
          centerTitle: true,
          leading: const Icon(
            Icons.menu,
            size: kIconSize30x,
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: kPS10x),
              child: Icon(Icons.search, size: kIconSize30x),
            ),
          ],
          backgroundColor: kPrimaryColor,
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ///first section
                SizedBox(
                  width: double.infinity,
                  height: kSectionHeight250x,
                  child: Banner(
                    itemCount: 5,
                    imageUrl:
                        'https://images.saymedia-content.com/.image/ar_4:3%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:eco%2Cw_1200/MTkxMzMxMTMxNzc2ODM3MjE4/anime-review-grand-blue2018.jpg',
                    movieTitle: 'Grand Blue : Grand Blue Dreaming',
                    movieURL: 'https://www.youtube.com/watch?v=7ygvyKSnmkI',
                    onTap: () async {
                      if (await canLaunchUrl(Uri.parse(
                          'https://www.youtube.com/watch?v=7ygvyKSnmkI'))) {
                        launchUrl(
                          Uri.parse(
                              'https://www.youtube.com/watch?v=7ygvyKSnmkI'),
                          mode: LaunchMode.externalApplication,
                        );
                      } else {
                        print('URL In Correct');
                      }
                    },
                  ),
                ),

                ///second section
                const MovieSection(
                  titleName: 'BEST POPULAR MOVIES AND SERIALS',
                    movieURL: 'https://images.hola.com/us/images/0276-154ed3dbb861-879c3314f647-1000/vertical-800/bullet-train-poster.jpg',
                  movieName: 'Bullet Train(2022)',
                  movieRating: '7.7',
                ),

                ///third section
                const SizedBox(
                  width: double.infinity,
                  height: kSectionHeight250x,
                  child: CheckMovieShowtime(),
                ),

                ///fourth section
                SizedBox(
                    width: double.infinity,
                    height: kSectionHeight250x,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const TabBarSection(),
                        Expanded(
                          flex: 5,
                          child: Container(
                            width: double.infinity,
                            color: kPrimaryColor,
                            child:  const MoviesCollection(
                              movieURL: 'https://m.media-amazon.com/images/M/MV5BNTVmM2ViMDQtMzlhNS00NmU5LWJiN2QtOTE2NjJhYjk1MTAzXkEyXkFqcGdeQXVyMTA4NjE0NjEy._V1_.jpg',
                              movieName: 'Bad boy for Life(2020)',
                              movieRating: '6.7',
                            ),
                          ),
                        )
                      ],
                    )),

                ///fifth section
                SizedBox(
                  width: double.infinity,
                  height: kSectionHeight250x,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const TitleForSection(
                          title: 'SHOWCASES', sideTitle: 'MORE SHOWCASES'),
                      Expanded(
                          flex: 6,
                          child: SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: kPS10x),
                              child: ShowCasesMovies(onTap: () async {
                                if (await canLaunchUrl(Uri.parse(
                                    'https://www.youtube.com/watch?v=pyWuHv2-Abk'))) {
                                  launchUrl(
                                    Uri.parse(
                                        'https://www.youtube.com/watch?v=pyWuHv2-Abk'),
                                    mode: LaunchMode.externalApplication,
                                  );
                                } else {
                                  print('URL In Correct');
                                }
                              }),
                              //'https://www.youtube.com/watch?v=pyWuHv2-Abk'
                            ),
                          ))
                    ],
                  ),
                ),

                ///sixth section
                const ActorSection(
                  titleName: 'Best Actor',
                  sideTitleName: 'More Actor',
                  itemCount: 10,
                  artistPhotoURL:
                      'https://cdn.myanimelist.net/images/characters/10/387495.jpg',
                  artistName: 'Iori Kitahara',
                ),
              ],
            )
          ],
        ));
  }
}

class MovieSection extends StatelessWidget {
  const MovieSection({
    Key? key,
    required this.titleName,
     this.sideTitleName='',
    required this.movieURL,
    required this.movieName,
    required this.movieRating,
  }) : super(key: key);
final String titleName;
final String sideTitleName;
final String movieURL;
final String movieName;
final String movieRating;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: kSectionHeight250x,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children:  [
          TitleForSection(
              title: titleName,
              sideTitle: sideTitleName),
           Expanded(
            flex: 5,
            child: MoviesCollection(
              movieURL:movieURL ,
              movieName: movieName,
              movieRating: movieRating,
            ),
          ),
        ],
      ),
    );
  }
}

class ActorSection extends StatelessWidget {
  const ActorSection({
    Key? key,
    required this.titleName,
    required this.sideTitleName,
    required this.itemCount,
    required this.artistPhotoURL,
    required this.artistName,
  }) : super(key: key);
  final String titleName;
  final String sideTitleName;
  final int itemCount;
  final String artistPhotoURL;
  final String artistName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: kSectionHeight250x,
      color: kPrimaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TitleForSection(title: titleName, sideTitle: sideTitleName),
          Expanded(
            flex: 6,
            child: ArtistSection(
              itemCount: itemCount,
              artistPhotoURL: artistPhotoURL,
              artistName: artistName,
            ),
          )
        ],
      ),
    );
  }
}

class ArtistSection extends StatelessWidget {
  const ArtistSection(
      {Key? key,
      required this.itemCount,
      required this.artistPhotoURL,
      required this.artistName})
      : super(key: key);
  final int itemCount;
  final String artistPhotoURL;
  final String artistName;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          width: kPS5x,
        );
      },
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(left: kPS5x, bottom: kPS10x),
              width: kArtistWidth,
              child: CachedNetworkImageWidget(
                imageUrl: artistPhotoURL,
                fit: BoxFit.cover,
              ),
            ),
            const Positioned(
                right: 0,
                child: Padding(
                  padding: EdgeInsets.only(top: kPS10x, right: kPS10x),
                  child: Icon(
                    Icons.favorite_border,
                    color: kWhiteColor,
                  ),
                )),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.01,
              child: Padding(
                padding: const EdgeInsets.only(left: kPS20x, bottom: kPS20x),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    EasyTextWidget(
                        //'Iori Kitahara'
                        text: artistName),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(
                          Icons.thumb_up,
                          size: kIconSize15x,
                          color: kAmberColor,
                        ),
                        SizedBox(
                          width: kPS5x,
                        ),
                        EasyTextWidget(
                          text: 'You Like This Movie...',
                          fontSize: kFontSize10x,
                          color: kGreyColor,
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class ShowCasesMovies extends StatelessWidget {
  const ShowCasesMovies({Key? key, required this.onTap}) : super(key: key);
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: kPS20x,
        );
      },
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          width: kShowCasesWidth,
          margin: const EdgeInsets.only(left: kPS10x),
          child: Stack(
            fit: StackFit.expand,
            children: [
              const CachedNetworkImageWidget(
                  fit: BoxFit.fill,
                  imageUrl:
                      'https://www.electric-shadows.com/wp-content/uploads/2016/10/Train-to-Busan-poster.jpg'),
              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: kPS10x, bottom: kPS10x),
                    child: EasyTextWidget(
                      text: "Train To Busan",
                      fontSize: kFontSize20x,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
              Center(
                  child: IconButton(
                onPressed: () => onTap(),
                icon: const Icon(
                  Icons.play_circle,
                  size: kPlayButtonSize50x,
                  color: kPlayButtonColor,
                ),
              ))
            ],
          ),
        );
      },
    );
  }
}

class MoviesCollection extends StatelessWidget {
  const MoviesCollection({
    Key? key,
    required this.movieURL,
    required this.movieName,
    required this.movieRating,
  }) : super(key: key);
final String movieURL;
final String movieName;
final String movieRating;


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        width: kPS10x,
      ),
      scrollDirection: Axis.horizontal,
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          width: kMovieContainerWidth,
          height: 200,
          margin: const EdgeInsets.only(left: kPS10x, bottom: kPS10x),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(
                width: kMovieWidth120x,
                height: kMovieHeight140x,
                child: CachedNetworkImageWidget(
                    fit: BoxFit.cover,
                    imageUrl: movieURL
                        ),
              ),
               EasyTextWidget(
                text: movieName,
                fontWeight: FontWeight.w600,
                fontSize: kFontSize14x,
              ),
              const SizedBox(
                height: kPS10x,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                   EasyTextWidget(
                    text: movieRating,
                    fontWeight: FontWeight.w600,
                    fontSize: kFontSize14x,
                  ),
                  const SizedBox(
                    width: kPS10x,
                  ),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                    itemSize: 16,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

class TabBarSection extends StatelessWidget {
  const TabBarSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: SizedBox(
          width: double.infinity,
          child: DefaultTabController(
              length: movieGenres.length,
              child: Padding(
                padding: const EdgeInsets.only(left: kPS10x, right: kPS10x),
                child: TabBar(
                    labelColor: kWhiteColor,
                    unselectedLabelColor: kGreyColor,
                    isScrollable: true,
                    indicatorColor: kAmberColor,
                    tabs: movieGenres
                        .map((e) => Tab(
                              text: e,
                            ))
                        .toList()),
              )),
        ));
  }
}

class CheckMovieShowtime extends StatelessWidget {
  const CheckMovieShowtime({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPS20x),
      child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kPS10x),
            color: kPrimaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: kMovieShowtimeWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    EasyTextWidget(
                      text: 'Check Movie Showtime',
                      fontSize: kFontSize25x,
                      fontWeight: FontWeight.w600,
                    ),
                    Text(
                      'SEE MORE',
                      style: TextStyle(
                          color: kAmberColor,
                          fontSize: kFontSize16x,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.location_on,
                size: kIconSize70x,
                color: kWhiteColor,
              )
            ],
          )),
    );
  }
}

class TitleForSection extends StatelessWidget {
  const TitleForSection(
      {Key? key, required this.title, required this.sideTitle})
      : super(key: key);
  final String title;
  final String sideTitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: kPS10x, right: kPS10x),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              EasyTextWidget(
                text: title,
                fontWeight: FontWeight.w600,
                fontSize: kFontSize14x,
                color: kGreyColor,
              ),
              EasyTextWidget(
                text: sideTitle,
                fontWeight: FontWeight.w600,
                fontSize: kFontSize14x,
                color: kWhiteColor,
                textDecorationUnderline: TextDecoration.underline,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Banner extends StatelessWidget {
  const Banner(
      {Key? key,
      required this.itemCount,
      required this.imageUrl,
      required this.movieTitle,
      required this.movieURL,
      required this.onTap})
      : super(key: key);
  final int itemCount;
  final String imageUrl;
  final String movieTitle;
  final String movieURL;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: itemCount,
      //scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Stack(
          // fit: StackFit.expand,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const DetailPage();
                  },
                ));
              },
              child: Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: CachedNetworkImageWidget(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(kPS10x),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  // width: 300,
                  child: EasyTextWidget(
                    text: movieTitle,
                    fontWeight: FontWeight.w600,
                    fontSize: kFontSize20x,
                  ),
                ),
              ),
            ),
            Center(
                child: IconButton(
              onPressed: () => onTap(),
              icon: const Icon(
                Icons.play_circle,
                size: kPlayButtonSize50x,
                color: kPlayButtonColor,
              ),
            )),
          ],
        );
      },
    );
  }
}
