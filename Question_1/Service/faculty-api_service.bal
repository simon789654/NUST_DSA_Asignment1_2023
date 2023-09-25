// AUTO-GENERATED FILE.
// This file is auto-generated by the Ballerina OpenAPI tool.

import ballerina/http;

listener http:Listener ep0 = new (9090, config = {host: "localhost"});

service / on ep0 {
    # Retrieve a list of all lecturers
    #
    # + return - Successful response 
    resource function get lecturers() returns Lecturer[] {
    }
    # Add a new lecturer
    #
    # + payload - New lecturer data 
    # + return - Lecturer added successfully 
    resource function post lecturers(@http:Payload Lecturer payload) returns Lecturer {
    }
    # Retrieve the details of a specific lecturer by their staff number
    #
    # + staffNumber - parameter description 
    # + return - returns can be any of following types
    # Lecturer (Successful response)
    # http:NotFound (Lecturer not found)
    resource function get lecturers/[string staffNumber]() returns Lecturer|http:NotFound {
    }
    # Update an existing lecturer's information
    #
    # + staffNumber - parameter description 
    # + payload - Updated lecturer data 
    # + return - returns can be any of following types
    # Lecturer (Lecturer updated successfully)
    # http:NotFound (Lecturer not found)
    resource function put lecturers/[string staffNumber](@http:Payload Lecturer payload) returns Lecturer|http:NotFound {
    }
    # Delete a lecturer's record by their staff number
    #
    # + staffNumber - parameter description 
    # + return - returns can be any of following types
    # http:NoContent (Lecturer deleted successfully)
    # http:NotFound (Lecturer not found)
    resource function delete lecturers/[string staffNumber]() returns http:NoContent|http:NotFound {
    }
    # Retrieve all the lecturers that teach a certain course
    #
    # + courseCode - parameter description 
    # + return - Successful response 
    resource function get courses/[string courseCode]/lecturers() returns Lecturer[] {
    }
    # Retrieve all the lecturers that sit in the same office
    #
    # + officeNumber - parameter description 
    # + return - Successful response 
    resource function get offices/[string officeNumber]/lecturers() returns Lecturer[] {
    }
}
