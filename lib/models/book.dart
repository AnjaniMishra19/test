class Book {
  final String title;
  final String urlImage;

  Book({
    this.title,
    this.urlImage,
  });
}

List<Book> allBooks = [
  Book(
    title: 'In search of Lost Food',
    urlImage:
        'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  ),
  Book(
    title: 'Critique of Sweets',
    urlImage:
        'https://images.unsplash.com/photo-1591123220262-87ed377f7c08?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=873&q=80',
  ),
  Book(
    title: 'Sports and Time',
    urlImage:
        'https://images.unsplash.com/photo-1535131749006-b7f58c99034b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
  ),
];
