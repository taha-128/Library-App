class Book {
  late String title;
  late String category;
  late String description;
  late String author;
  late String thumbnail;
  late String puplishingDate;
  late String downloadingLink;
  late double pdfSize;
  late double rating;
  late List? moreBooks;
  late int bookPages;
  Book({
    required this.title,
    required this.category,
    required this.description,
    required this.author,
    required this.thumbnail,
    required this.puplishingDate,
    required this.downloadingLink,
    required this.pdfSize,
    required this.moreBooks,
    required this.bookPages,
    required this.rating,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'],
      category: json['category'],
      description: json['description'],
      author: json['author'],
      thumbnail: json['thumbnail'],
      puplishingDate: json['puplishing_date'].toString(),
      downloadingLink: json['downloading_link'],
      pdfSize: json['pdf_size'].toDouble(),
      moreBooks: json['more_books'],
      bookPages: json['book_pages'],
      rating: json['rating'].toDouble(),
    );
  }
}
