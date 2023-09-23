import ballerina/grpc;
import ballerina/io;

map<json> booksDB = {
    "9780061120084": {
        isbn: "9780061120084",
        title: "To Kill a Mockingbird",
        author_1: "Harper Lee",
        author_2: "",
        location: "Fiction Section",
        status: "Available"
    },
    "9781984801258": {
        isbn: "9781984801258",
        title: "Becoming",
        author_1: "Michelle Obama",
        author_2: "",
        location: "Biography Section",
        status: "Available"
    }
};

map<json> Users = {
    "1102": {user_id: "1102", user_type: "student", name: "Sam Simon"},
    "1103": {user_id: "1103", user_type: "librarian", name: "Kev Ndec"}
};

listener grpc:Listener ep = new (9082);

@grpc:Descriptor {value: LIBRARY_DESC}
service "LibraryService" on ep {

    remote function AddBook(Book value) returns string|error {
        if (booksDB.hasKey(value.isbn)) {
            return error("book already exist");
        }
        booksDB[value.isbn] = value;
        string response = "The book with isbn number " + value.isbn + " sucessfully added";
        return response;
    }
    remote function UpdateBook(Book value) returns Book|error {
        json isbook = booksDB[value.isbn];
        if (isbook == null) {
            return error("The book doesn't exist");
        }
        booksDB[value.isbn] = <Book>value;

        return value;
    }
    remote function RemoveBook(BookRequest value) returns BooksResponse|error {
        json isbook = booksDB[value.isbn];
        if (isbook == null) {
            return error("The book doesn't exist");
        }
        _ = booksDB.remove(value.isbn);

        return {isbn: value.isbn};
    }
    remote function ListAvailableBooks(EmptyRequest value) returns json {
        // Book[] books = <Book[]>booksDB.toArray();
        return {books: booksDB.toArray()};
    }
    remote function LocateBook(BookRequest value) returns BookLocationResponse|error {
        json isbook = booksDB[value.isbn];
        if (isbook == null) {
            return error("The book doesn't exist");
        }

        if (isbook?.status != "Available") {
            return error("The book is not available");
        }

        BookLocationResponse response = {};
        response.location = check isbook?.location;
        return response;

    }
    remote function BorrowBook(BorrowBookRequest value) returns BorrowBookResponse|error {
        Book isbook = <Book>booksDB[value.isbn];
        if (isbook.isbn == "") {
            return error("The book doesn't exist");
        }

        json isUser = Users[value.user_id];
        if (isUser == null) {
            return error("user not found");
        }

        isbook.status = "Not Available";
        booksDB[value.isbn] = isbook;
        return {message: "The book with isbn number " + value.isbn + " sucessfully borrowed"};
    }
    remote function CreateUsers(stream<UserRequest, grpc:Error?> clientStream) returns string|error {
        error? e = clientStream.forEach(function(UserRequest user) {
            if Users.hasKey(user.user_id) {
                do {
                    check error("User already exist");

                } on fail var ex {
                    io:print(ex);
                }
            }
            Users[user.user_id] = user;
        });

        if (e is error) {
            return error("Something went wrong");
        }

        return "User(s) added successfully";
    }
}
