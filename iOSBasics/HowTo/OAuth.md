#  OAuth

## Definition  
OAuth is a specification for authorization

OAuth 2.0 is a specification for authorization, but NOT for authentication. RFC 6749, 3.1. Authorization Endpoint explicitly says as follows:

## Authentication vs Authorization 
Authentication is a process to determine the subject (= unique identifier) of an end-user. There are many ways to determine the subject. ID & password, fingerprints, iris recognition, etc.

Authorization is a process to associate the subject with the requested permissions and the client application that requested the permissions. An access token represents the association.
