import ballerina/io;

LibraryServiceClient ep = check new ("http://localhost:9088");

public function main() returns error? {
    Book addBookRequest = {isbn: "ballerina", title: "ballerina", author_1: "ballerina", author_2: "ballerina", location: "ballerina", status: "ballerina"};
    AddBookResponse addBookResponse = check ep->AddBook(addBookRequest);
    io:println(addBookResponse);

    Book updateBookRequest = {isbn: "ballerina", title: "ballerina", author_1: "ballerina", author_2: "ballerina", location: "ballerina", status: "ballerina"};
    Book updateBookResponse = check ep->UpdateBook(updateBookRequest);
    io:println(updateBookResponse);

    BookRequest removeBookRequest = {isbn: "ballerina"};
    BooksResponse removeBookResponse = check ep->RemoveBook(removeBookRequest);
    io:println(removeBookResponse);

    EmptyRequest listAvailableBooksRequest = {};
    BooksList listAvailableBooksResponse = check ep->ListAvailableBooks(listAvailableBooksRequest);
    io:println(listAvailableBooksResponse);

    BookRequest locateBookRequest = {isbn: "ballerina"};
    BookLocationResponse locateBookResponse = check ep->LocateBook(locateBookRequest);
    io:println(locateBookResponse);

    BorrowBookRequest borrowBookRequest = {user_id: "ballerina", isbn: "ballerina"};
    BorrowBookResponse borrowBookResponse = check ep->BorrowBook(borrowBookRequest);
    io:println(borrowBookResponse);

    UserRequest createUsersRequest = {user_id: "ballerina", user_type: "ballerina", name: "ballerina"};
    CreateUsersStreamingClient createUsersStreamingClient = check ep->CreateUsers();
    check createUsersStreamingClient->sendUserRequest(createUsersRequest);
    check createUsersStreamingClient->complete();
    EmptyResponse? createUsersResponse = check createUsersStreamingClient->receiveEmptyResponse();
    io:println(createUsersResponse);
}

