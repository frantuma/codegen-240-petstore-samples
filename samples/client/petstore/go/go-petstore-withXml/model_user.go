/*
 * Swagger Petstore
 *
 * This is a sample server Petstore server.  You can find out more about Swagger at [http://swagger.io](http://swagger.io) or on [irc.freenode.net, #swagger](http://swagger.io/irc/).  For this sample, you can use the api key `special-key` to test the authorization filters.
 *
 * API version: 1.0.0
 * Contact: apiteam@swagger.io
 * Generated by: Swagger Codegen (https://github.com/swagger-api/swagger-codegen.git)
 */

package petstore

type User struct {
	Id int64 `json:"id,omitempty" xml:"id"`
	Username string `json:"username,omitempty" xml:"username"`
	FirstName string `json:"firstName,omitempty" xml:"firstName"`
	LastName string `json:"lastName,omitempty" xml:"lastName"`
	Email string `json:"email,omitempty" xml:"email"`
	Password string `json:"password,omitempty" xml:"password"`
	Phone string `json:"phone,omitempty" xml:"phone"`
	// User Status
	UserStatus int32 `json:"userStatus,omitempty" xml:"userStatus"`
}
