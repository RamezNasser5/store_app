class RatingModel {
  dynamic rate;
  dynamic count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(jsonData) {
    if (jsonData != null) {
      // Check if 'rating' key exists in jsonData
      if (jsonData.containsKey('rating')) {
        final Map<String, dynamic> ratingData = jsonData['rating'];
        return RatingModel(
          rate: ratingData['rate'],
          count: ratingData['count'],
        );
      } else {
        // Handle the case where 'rating' key is not present
        return RatingModel(
            rate: 0,
            count: 0); // You can set default values or handle it as needed.
      }
    } else {
      // Handle the case where jsonData is null
      return RatingModel(
          rate: 0,
          count: 0); // You can set default values or handle it as needed.
    }
  }
}
