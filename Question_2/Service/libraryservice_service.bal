import ballerina/grpc;

listener grpc:Listener ep = new (9090);

@grpc:Descriptor {value: LIBRARY_DESC}
service "LibraryService" on ep {

    remote function AddBook(Book value) returns AddBookResponse|error {
    }
    remote function UpdateBook(Book value) returns Book|error {
    }
    remote function RemoveBook(BookRequest value) returns BooksResponse|error {
    }
    remote function ListAvailableBooks(EmptyRequest value) returns BooksList|error {
    }
    remote function LocateBook(BookRequest value) returns BookLocationResponse|error {
    }
    remote function BorrowBook(BorrowBookRequest value) returns BorrowBookResponse|error {
    }
    remote function CreateUsers(stream<UserRequest, grpc:Error?> clientStream) returns EmptyResponse|error {
    }
}

