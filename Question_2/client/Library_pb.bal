import ballerina/grpc;
import ballerina/protobuf;

public const string LIBRARY_DESC = "0A0D4C6962726172792E70726F746F12076C69627261727922210A0B426F6F6B5265717565737412120A046973626E18012001280952046973626E22310A0C426F6F6B526573706F6E736512210A04626F6F6B18012001280B320D2E6C6962726172792E426F6F6B5204626F6F6B22300A09426F6F6B734C69737412230A05626F6F6B7318012003280B320D2E6C6962726172792E426F6F6B5205626F6F6B7322230A0D426F6F6B73526573706F6E736512120A046973626E18012001280952046973626E22320A14426F6F6B4C6F636174696F6E526573706F6E7365121A0A086C6F636174696F6E18012001280952086C6F636174696F6E22400A11426F72726F77426F6F6B5265717565737412170A07757365725F6964180120012809520675736572496412120A046973626E18022001280952046973626E222E0A12426F72726F77426F6F6B526573706F6E736512180A076D65737361676518012001280952076D65737361676522570A0B557365725265717565737412170A07757365725F69641801200128095206757365724964121B0A09757365725F747970651802200128095208757365725479706512120A046E616D6518032001280952046E616D65220E0A0C456D7074795265717565737422290A0D456D707479526573706F6E736512180A076D65737361676518012001280952076D657373616765229A010A04426F6F6B12120A046973626E18012001280952046973626E12140A057469746C6518022001280952057469746C6512190A08617574686F725F311803200128095207617574686F723112190A08617574686F725F321804200128095207617574686F7232121A0A086C6F636174696F6E18052001280952086C6F636174696F6E12160A067374617475731806200128095206737461747573222B0A0F416464426F6F6B526573706F6E736512180A076D65737361676518012001280952076D65737361676532C4030A0E4C6962726172795365727669636512340A07416464426F6F6B120D2E6C6962726172792E426F6F6B1A182E6C6962726172792E416464426F6F6B526573706F6E73652200122C0A0A557064617465426F6F6B120D2E6C6962726172792E426F6F6B1A0D2E6C6962726172792E426F6F6B2200123C0A0A52656D6F7665426F6F6B12142E6C6962726172792E426F6F6B526571756573741A162E6C6962726172792E426F6F6B73526573706F6E7365220012410A124C697374417661696C61626C65426F6F6B7312152E6C6962726172792E456D707479526571756573741A122E6C6962726172792E426F6F6B734C697374220012430A0A4C6F63617465426F6F6B12142E6C6962726172792E426F6F6B526571756573741A1D2E6C6962726172792E426F6F6B4C6F636174696F6E526573706F6E7365220012470A0A426F72726F77426F6F6B121A2E6C6962726172792E426F72726F77426F6F6B526571756573741A1B2E6C6962726172792E426F72726F77426F6F6B526573706F6E73652200123F0A0B437265617465557365727312142E6C6962726172792E55736572526571756573741A162E6C6962726172792E456D707479526573706F6E736522002801620670726F746F33";

public isolated client class LibraryServiceClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, LIBRARY_DESC);
    }

    isolated remote function AddBook(Book|ContextBook req) returns AddBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        Book message;
        if req is ContextBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/AddBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <AddBookResponse>result;
    }

    isolated remote function AddBookContext(Book|ContextBook req) returns ContextAddBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        Book message;
        if req is ContextBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/AddBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <AddBookResponse>result, headers: respHeaders};
    }

    isolated remote function UpdateBook(Book|ContextBook req) returns Book|grpc:Error {
        map<string|string[]> headers = {};
        Book message;
        if req is ContextBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/UpdateBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Book>result;
    }

    isolated remote function UpdateBookContext(Book|ContextBook req) returns ContextBook|grpc:Error {
        map<string|string[]> headers = {};
        Book message;
        if req is ContextBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/UpdateBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Book>result, headers: respHeaders};
    }

    isolated remote function RemoveBook(BookRequest|ContextBookRequest req) returns BooksResponse|grpc:Error {
        map<string|string[]> headers = {};
        BookRequest message;
        if req is ContextBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/RemoveBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <BooksResponse>result;
    }

    isolated remote function RemoveBookContext(BookRequest|ContextBookRequest req) returns ContextBooksResponse|grpc:Error {
        map<string|string[]> headers = {};
        BookRequest message;
        if req is ContextBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/RemoveBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <BooksResponse>result, headers: respHeaders};
    }

    isolated remote function ListAvailableBooks(EmptyRequest|ContextEmptyRequest req) returns BooksList|grpc:Error {
        map<string|string[]> headers = {};
        EmptyRequest message;
        if req is ContextEmptyRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/ListAvailableBooks", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <BooksList>result;
    }

    isolated remote function ListAvailableBooksContext(EmptyRequest|ContextEmptyRequest req) returns ContextBooksList|grpc:Error {
        map<string|string[]> headers = {};
        EmptyRequest message;
        if req is ContextEmptyRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/ListAvailableBooks", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <BooksList>result, headers: respHeaders};
    }

    isolated remote function LocateBook(BookRequest|ContextBookRequest req) returns BookLocationResponse|grpc:Error {
        map<string|string[]> headers = {};
        BookRequest message;
        if req is ContextBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/LocateBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <BookLocationResponse>result;
    }

    isolated remote function LocateBookContext(BookRequest|ContextBookRequest req) returns ContextBookLocationResponse|grpc:Error {
        map<string|string[]> headers = {};
        BookRequest message;
        if req is ContextBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/LocateBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <BookLocationResponse>result, headers: respHeaders};
    }

    isolated remote function BorrowBook(BorrowBookRequest|ContextBorrowBookRequest req) returns BorrowBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        BorrowBookRequest message;
        if req is ContextBorrowBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/BorrowBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <BorrowBookResponse>result;
    }

    isolated remote function BorrowBookContext(BorrowBookRequest|ContextBorrowBookRequest req) returns ContextBorrowBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        BorrowBookRequest message;
        if req is ContextBorrowBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/BorrowBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <BorrowBookResponse>result, headers: respHeaders};
    }

    isolated remote function CreateUsers() returns CreateUsersStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeClientStreaming("library.LibraryService/CreateUsers");
        return new CreateUsersStreamingClient(sClient);
    }
}

public client class CreateUsersStreamingClient {
    private grpc:StreamingClient sClient;

    isolated function init(grpc:StreamingClient sClient) {
        self.sClient = sClient;
    }

    isolated remote function sendUserRequest(UserRequest message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function sendContextUserRequest(ContextUserRequest message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function receiveEmptyResponse() returns EmptyResponse|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return <EmptyResponse>payload;
        }
    }

    isolated remote function receiveContextEmptyResponse() returns ContextEmptyResponse|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: <EmptyResponse>payload, headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public type ContextUserRequestStream record {|
    stream<UserRequest, error?> content;
    map<string|string[]> headers;
|};

public type ContextBooksResponse record {|
    BooksResponse content;
    map<string|string[]> headers;
|};

public type ContextBooksList record {|
    BooksList content;
    map<string|string[]> headers;
|};

public type ContextBorrowBookResponse record {|
    BorrowBookResponse content;
    map<string|string[]> headers;
|};

public type ContextBook record {|
    Book content;
    map<string|string[]> headers;
|};

public type ContextBorrowBookRequest record {|
    BorrowBookRequest content;
    map<string|string[]> headers;
|};

public type ContextBookRequest record {|
    BookRequest content;
    map<string|string[]> headers;
|};

public type ContextEmptyRequest record {|
    EmptyRequest content;
    map<string|string[]> headers;
|};

public type ContextAddBookResponse record {|
    AddBookResponse content;
    map<string|string[]> headers;
|};

public type ContextBookLocationResponse record {|
    BookLocationResponse content;
    map<string|string[]> headers;
|};

public type ContextEmptyResponse record {|
    EmptyResponse content;
    map<string|string[]> headers;
|};

public type ContextUserRequest record {|
    UserRequest content;
    map<string|string[]> headers;
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type BookResponse record {|
    Book book = {};
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type BooksList record {|
    Book[] books = [];
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type BooksResponse record {|
    string isbn = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type BorrowBookResponse record {|
    string message = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type Book record {|
    string isbn = "";
    string title = "";
    string author_1 = "";
    string author_2 = "";
    string location = "";
    string status = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type BorrowBookRequest record {|
    string user_id = "";
    string isbn = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type BookRequest record {|
    string isbn = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type EmptyRequest record {|
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type AddBookResponse record {|
    string message = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type BookLocationResponse record {|
    string location = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type EmptyResponse record {|
    string message = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type UserRequest record {|
    string user_id = "";
    string user_type = "";
    string name = "";
|};

