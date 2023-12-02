class MovieModel {
  final String name;
  final int rating;
  final int id;
  final String imgPath;
  MovieModel({
    required this.name,
    required this.rating,
    required this.imgPath,
    required this.id,
  });
}

List<MovieModel> movieList = [
  MovieModel(
    name: "Blacklist",
    rating: 5,
    id: 1,
    imgPath: "assets/blacklist.png",
  ),
  MovieModel(
    id: 2,
    name: "The 100",
    rating: 5,
    imgPath: "assets/thecent.png",
  ),
  MovieModel(
    id: 3,
    name: "Blindspot",
    rating: 5,
    imgPath: "assets/blindspot.png",
  ),
  MovieModel(
    name: "Prison Break",
    rating: 5,
    id: 4,
    imgPath: "assets/prisonbreak.jpeg",
  ),
  MovieModel(
    name: "24H CHRONO",
    id: 5,
    rating: 5,
    imgPath: "assets/jackbauer.png",
  ),
];
