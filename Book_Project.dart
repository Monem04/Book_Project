import 'dart:io';
class Book {
  String title;
  String author;
  int publicationYear;
  int pagesRead;

  static int totalBooks = 0;

  Book(this.title,this.author,this.publicationYear):pagesRead = 0 {
    totalBooks++;
  }

  void read(int pages) {
    pagesRead += pages;
  }

  int getPagesRead() {
    return pagesRead;
  }

  String getTitle() {
    return title;
  }

  String getAuthor() {
    return author;
  }

  int getPublicationYear() {
    return publicationYear;
  }

  int getBookAge() {
    int currentYear = DateTime.now().year;
    return currentYear - publicationYear;
  }

  static int getTotalBooks() {
    return totalBooks;
  }
}

void addNewBook(List<Book> bookList) {
  print('Enter book title:');
  String? title = stdin.readLineSync();

  print('Enter book author:');
  String? author = stdin.readLineSync();

  print('Enter publication year:');
  int publicationYear = int.parse(stdin.readLineSync()!);

  Book newBook = Book(title!, author!, publicationYear);
  bookList.add(newBook);
  print('Book added successfully!\n');
}

void viewAllBooks(List<Book> bookList) {
  if (bookList.isEmpty) {
    print('No books available.\n');
    return;
  }

  for (var book in bookList) {
    print('Title: ${book.getTitle()}, Author: ${book.getAuthor()}, Year: ${book.getPublicationYear()}, Pages read: ${book.getPagesRead()}, Age: ${book.getBookAge()} years');
  }
  print('\n');
}

void readPages(List<Book> bookList) {
  if (bookList.isEmpty) {
    print('No books available to read.\n');
    return;
  }

  print('Select a book to read pages from (Enter book number):');
  for (int i = 0; i < bookList.length; i++) {
    print('${i + 1}. ${bookList[i].getTitle()}');
  }

  int bookIndex = int.parse(stdin.readLineSync()!) - 1;

  if (bookIndex < 0 || bookIndex >= bookList.length) {
    print('Invalid choice.\n');
    return;
  }

  print('Enter number of pages to read:');
  int pages = int.parse(stdin.readLineSync()!);

  bookList[bookIndex].read(pages);
  print('Pages updated for ${bookList[bookIndex].getTitle()}.\n');
}

void showTotalBooks() {
  print('Total books created: ${Book.getTotalBooks()}\n');
}

void main() {
  List<Book> bookList = [];
  bool exit = false;

  while (!exit) {
    print('Options:');
    print('1. Add a new book');
    print('2. View all books');
    print('3. Read pages from a book');
    print('4. Show total books created');
    print('5. Exit');
    print('Enter your choice:');

    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        addNewBook(bookList);
        break;
      case 2:
        viewAllBooks(bookList);
        break;
      case 3:
        readPages(bookList);
        break;
      case 4:
        showTotalBooks();
        break;
      case 5:
        exit = true;
        print('Thank you for using our system!');
        break;
      default:
        print('Invalid choice, please try again.\n');
    }
  }
}