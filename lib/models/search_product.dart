class Product {
  final int id;
  final String title;
  final String author;
  final String urlImage;

  Product({
    this.id,
    this.title,
    this.author,
    this.urlImage,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      title: json['title'] as String,
      author: json['author'] as String,
      urlImage: json['urlImage'] as String,
    );
  }
}

final allProduct = [
  Product(
    id: 1,
    author: 'Ardi Evans',
    title: 'Modern Buildings',
    urlImage:
        'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  ),
  Product(
    id: 2,
    author: 'Bhuvan',
    title: 'Cars and Bikes',
    urlImage:
        'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  ),
  Product(
    id: 3,
    author: 'Canvash',
    title: 'Fresh food',
    urlImage:
        'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  ),
  Product(
    id: 4,
    author: 'dramatey',
    title: 'Smart Mobile',
    urlImage:
        'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  ),
];
