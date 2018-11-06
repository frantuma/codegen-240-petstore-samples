# Swagger Petstore API Client

This is a sample server Petstore server.  You can find out more about Swagger at [http://swagger.io](http://swagger.io) or on [irc.freenode.net, #swagger](http://swagger.io/irc/).  For this sample, you can use the api key `special-key` to test the authorization filters.

## Requirements

- [Salesforce DX](https://www.salesforce.com/products/platform/products/salesforce-dx/)


If everything is set correctly:

- Running `sfdx version` in a command prompt should output something like:

  ```bash
  sfdx-cli/5.7.5-05549de (darwin-amd64) go1.7.5 sfdxstable
  ```


## Installation

1. Copy the output into your Salesforce DX folder - or alternatively deploy the output directly into the workspace.
2. Deploy the code via Salesforce DX to your Scratch Org

   ```bash
   $ sfdx force:source:push
   ```
3. If the API needs authentication update the Named Credential in Setup.
4. Run your Apex tests using

    ```bash
    $ sfdx sfdx force:apex:test:run
    ```
5. Retrieve the job id from the console and check the test results.

  ```bash
  $ sfdx force:apex:test:report -i theJobId
  ```


## Getting Started

Please follow the [installation](#installation) instruction and execute the following Apex code:

```java
SwagPetApi api = new SwagPetApi();
SwagClient client = api.getClient();


Map<String, Object> params = new Map<String, Object>{
    'body' => SwagPet.getExample()
};

try {
    // cross your fingers
    api.addPet(params);
} catch (Swagger.ApiException e) {
    // ...handle your exceptions
}
```

## Documentation for API Endpoints

All URIs are relative to *https://petstore.swagger.io/v2*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*SwagPetApi* | [**addPet**](docs/SwagPetApi.md#addPet) | **POST** /pet | Add a new pet to the store
*SwagPetApi* | [**deletePet**](docs/SwagPetApi.md#deletePet) | **DELETE** /pet/{petId} | Deletes a pet
*SwagPetApi* | [**findPetsByStatus**](docs/SwagPetApi.md#findPetsByStatus) | **GET** /pet/findByStatus | Finds Pets by status
*SwagPetApi* | [**findPetsByTags**](docs/SwagPetApi.md#findPetsByTags) | **GET** /pet/findByTags | Finds Pets by tags
*SwagPetApi* | [**getPetById**](docs/SwagPetApi.md#getPetById) | **GET** /pet/{petId} | Find pet by ID
*SwagPetApi* | [**updatePet**](docs/SwagPetApi.md#updatePet) | **PUT** /pet | Update an existing pet
*SwagPetApi* | [**updatePetWithForm**](docs/SwagPetApi.md#updatePetWithForm) | **POST** /pet/{petId} | Updates a pet in the store with form data
*SwagPetApi* | [**uploadFile**](docs/SwagPetApi.md#uploadFile) | **POST** /pet/{petId}/uploadImage | uploads an image
*SwagStoreApi* | [**deleteOrder**](docs/SwagStoreApi.md#deleteOrder) | **DELETE** /store/order/{orderId} | Delete purchase order by ID
*SwagStoreApi* | [**getInventory**](docs/SwagStoreApi.md#getInventory) | **GET** /store/inventory | Returns pet inventories by status
*SwagStoreApi* | [**getOrderById**](docs/SwagStoreApi.md#getOrderById) | **GET** /store/order/{orderId} | Find purchase order by ID
*SwagStoreApi* | [**placeOrder**](docs/SwagStoreApi.md#placeOrder) | **POST** /store/order | Place an order for a pet
*SwagUserApi* | [**createUser**](docs/SwagUserApi.md#createUser) | **POST** /user | Create user
*SwagUserApi* | [**createUsersWithArrayInput**](docs/SwagUserApi.md#createUsersWithArrayInput) | **POST** /user/createWithArray | Creates list of users with given input array
*SwagUserApi* | [**createUsersWithListInput**](docs/SwagUserApi.md#createUsersWithListInput) | **POST** /user/createWithList | Creates list of users with given input array
*SwagUserApi* | [**deleteUser**](docs/SwagUserApi.md#deleteUser) | **DELETE** /user/{username} | Delete user
*SwagUserApi* | [**getUserByName**](docs/SwagUserApi.md#getUserByName) | **GET** /user/{username} | Get user by user name
*SwagUserApi* | [**loginUser**](docs/SwagUserApi.md#loginUser) | **GET** /user/login | Logs user into the system
*SwagUserApi* | [**logoutUser**](docs/SwagUserApi.md#logoutUser) | **GET** /user/logout | Logs out current logged in user session
*SwagUserApi* | [**updateUser**](docs/SwagUserApi.md#updateUser) | **PUT** /user/{username} | Updated user


## Documentation for Models

 - [SwagApiResponse](docs/SwagApiResponse.md)
 - [SwagCategory](docs/SwagCategory.md)
 - [SwagOrder](docs/SwagOrder.md)
 - [SwagPet](docs/SwagPet.md)
 - [SwagTag](docs/SwagTag.md)
 - [SwagUser](docs/SwagUser.md)


## Documentation for Authorization

Authentication schemes defined for the API:
### api_key

- **Type**: API key
- **API key parameter name**: api_key
- **Location**: HTTP header

### petstore_auth

- **Type**: OAuth
- **Flow**: implicit
- **Authorizatoin URL**: https://petstore.swagger.io/oauth/dialog
- **Scopes**: 
  - write:pets: modify pets in your account
  - read:pets: read your pets


## Author

apiteam@swagger.io

