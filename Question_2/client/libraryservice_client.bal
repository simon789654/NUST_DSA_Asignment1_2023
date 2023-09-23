import ballerina/io;

LibraryServiceClient ep = check new ("http://localhost:9082");

public function main() returns error? {
    Book addBookRequest = { isbn: "978-0061120084", title: "To Kill a Mockingbird", author_1: "Harper Lee", author_2: "", location: "New York",status: "Available"};
    AddBookResponse addBookResponse = check ep->AddBook(addBookRequest);
    io:println(addBookResponse);

    Book updateBookRequest = { isbn: "978-0061120084", title: "To Kill a Mockingbird", author_1: "Harper Lee", author_2: "Kevin Damaseb", location: "New York",status: "Available"};
    Book updateBookResponse = check ep->UpdateBook(updateBookRequest);
    io:println(updateBookResponse);

    BookRequest removeBookRequest = {isbn: "9781984801258"};
    BooksResponse removeBookResponse = check ep->RemoveBook(removeBookRequest);
    io:println(removeBookResponse);

    EmptyRequest listAvailableBooksRequest = {};
    json listAvailableBooksResponse = check ep->ListAvailableBooks(listAvailableBooksRequest);
    io:println(listAvailableBooksResponse);

    BookRequest locateBookRequest = {isbn: "978-0061120084"};
    BookLocationResponse locateBookResponse = check ep->LocateBook(locateBookRequest);
    io:println(locateBookResponse);

    BorrowBookRequest borrowBookRequest = {user_id: "1102", isbn: "978-0061120084"};
    BorrowBookResponse borrowBookResponse = check ep->BorrowBook(borrowBookRequest);
    io:println(borrowBookResponse);

    UserRequest createUsersRequest = {user_id: "ballerina", user_type: "ballerina", name: "ballerina"};
    CreateUsersStreamingClient createUsersStreamingClient = check ep->CreateUsers();
    check createUsersStreamingClient->sendUserRequest(createUsersRequest);
    check createUsersStreamingClient->complete();
    EmptyResponse? createUsersResponse = check createUsersStreamingClient->receiveEmptyResponse();
    io:println(createUsersResponse);
}
