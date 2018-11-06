/**
* Swagger Petstore
* This is a sample server Petstore server.  You can find out more about Swagger at [http://swagger.io](http://swagger.io) or on [irc.freenode.net, #swagger](http://swagger.io/irc/).  For this sample, you can use the api key `special-key` to test the authorization filters.
*
* OpenAPI spec version: 1.0.0
* Contact: apiteam@swagger.io
*
* NOTE: This class is auto generated by the swagger code generator program.
* https://github.com/swagger-api/swagger-codegen.git
* Do not edit the class manually.
*/
package io.swagger.client.apis

import io.swagger.client.models.ApiResponse
import io.swagger.client.models.Pet

import io.swagger.client.infrastructure.*

class PetApi(basePath: kotlin.String = "https://petstore.swagger.io/v2") : ApiClient(basePath) {

    /**
    * Add a new pet to the store
    * 
    * @param body Pet object that needs to be added to the store 
    * @return void
    */
    fun addPet(body: Pet) : Unit {
        val localVariableBody: kotlin.Any? = body
        val localVariableQuery: MultiValueMap = mapOf()
        
        val contentHeaders: kotlin.collections.Map<kotlin.String,kotlin.String> = mapOf()
        val acceptsHeaders: kotlin.collections.Map<kotlin.String,kotlin.String> = mapOf("Accept" to "application/xml, application/json")
        val localVariableHeaders: kotlin.collections.MutableMap<kotlin.String,kotlin.String> = mutableMapOf()
        localVariableHeaders.putAll(contentHeaders)
        localVariableHeaders.putAll(acceptsHeaders)
        
        val localVariableConfig = RequestConfig(
            RequestMethod.POST,
            "/pet",
            query = localVariableQuery,
            headers = localVariableHeaders
        )
        val response = request<Any?>(
            localVariableConfig,
            localVariableBody
        )

        return when (response.responseType) {
            ResponseType.Success -> Unit
            ResponseType.Informational -> TODO()
            ResponseType.Redirection -> TODO()
            ResponseType.ClientError -> throw ClientException((response as ClientError<*>).body as? String ?: "Client error")
            ResponseType.ServerError -> throw ServerException((response as ServerError<*>).message ?: "Server error")
            else -> throw kotlin.IllegalStateException("Undefined ResponseType.")
        }
    }

    /**
    * Deletes a pet
    * 
    * @param petId Pet id to delete 
    * @param apiKey  (optional)
    * @return void
    */
    fun deletePet(petId: kotlin.Long, apiKey: kotlin.String) : Unit {
        val localVariableBody: kotlin.Any? = null
        val localVariableQuery: MultiValueMap = mapOf()
        
        val contentHeaders: kotlin.collections.Map<kotlin.String,kotlin.String> = mapOf()
        val acceptsHeaders: kotlin.collections.Map<kotlin.String,kotlin.String> = mapOf("Accept" to "application/xml, application/json")
        val localVariableHeaders: kotlin.collections.MutableMap<kotlin.String,kotlin.String> = mutableMapOf("api_key" to apiKey)
        localVariableHeaders.putAll(contentHeaders)
        localVariableHeaders.putAll(acceptsHeaders)
        
        val localVariableConfig = RequestConfig(
            RequestMethod.DELETE,
            "/pet/{petId}".replace("{"+"petId"+"}", "$petId"),
            query = localVariableQuery,
            headers = localVariableHeaders
        )
        val response = request<Any?>(
            localVariableConfig,
            localVariableBody
        )

        return when (response.responseType) {
            ResponseType.Success -> Unit
            ResponseType.Informational -> TODO()
            ResponseType.Redirection -> TODO()
            ResponseType.ClientError -> throw ClientException((response as ClientError<*>).body as? String ?: "Client error")
            ResponseType.ServerError -> throw ServerException((response as ServerError<*>).message ?: "Server error")
            else -> throw kotlin.IllegalStateException("Undefined ResponseType.")
        }
    }

    /**
    * Finds Pets by status
    * Multiple status values can be provided with comma separated strings
    * @param status Status values that need to be considered for filter 
    * @return kotlin.Array<Pet>
    */
    @Suppress("UNCHECKED_CAST")
    fun findPetsByStatus(status: kotlin.Array<kotlin.String>) : kotlin.Array<Pet> {
        val localVariableBody: kotlin.Any? = null
        val localVariableQuery: MultiValueMap = mapOf("status" to toMultiValue(status.toList(), "multi"))
        
        val contentHeaders: kotlin.collections.Map<kotlin.String,kotlin.String> = mapOf()
        val acceptsHeaders: kotlin.collections.Map<kotlin.String,kotlin.String> = mapOf("Accept" to "application/xml, application/json")
        val localVariableHeaders: kotlin.collections.MutableMap<kotlin.String,kotlin.String> = mutableMapOf()
        localVariableHeaders.putAll(contentHeaders)
        localVariableHeaders.putAll(acceptsHeaders)
        
        val localVariableConfig = RequestConfig(
            RequestMethod.GET,
            "/pet/findByStatus",
            query = localVariableQuery,
            headers = localVariableHeaders
        )
        val response = request<kotlin.Array<Pet>>(
            localVariableConfig,
            localVariableBody
        )

        return when (response.responseType) {
            ResponseType.Success -> (response as Success<*>).data as kotlin.Array<Pet>
            ResponseType.Informational -> TODO()
            ResponseType.Redirection -> TODO()
            ResponseType.ClientError -> throw ClientException((response as ClientError<*>).body as? String ?: "Client error")
            ResponseType.ServerError -> throw ServerException((response as ServerError<*>).message ?: "Server error")
            else -> throw kotlin.IllegalStateException("Undefined ResponseType.")
        }
    }

    /**
    * Finds Pets by tags
    * Muliple tags can be provided with comma separated strings. Use tag1, tag2, tag3 for testing.
    * @param tags Tags to filter by 
    * @return kotlin.Array<Pet>
    */
    @Suppress("UNCHECKED_CAST")
    fun findPetsByTags(tags: kotlin.Array<kotlin.String>) : kotlin.Array<Pet> {
        val localVariableBody: kotlin.Any? = null
        val localVariableQuery: MultiValueMap = mapOf("tags" to toMultiValue(tags.toList(), "multi"))
        
        val contentHeaders: kotlin.collections.Map<kotlin.String,kotlin.String> = mapOf()
        val acceptsHeaders: kotlin.collections.Map<kotlin.String,kotlin.String> = mapOf("Accept" to "application/xml, application/json")
        val localVariableHeaders: kotlin.collections.MutableMap<kotlin.String,kotlin.String> = mutableMapOf()
        localVariableHeaders.putAll(contentHeaders)
        localVariableHeaders.putAll(acceptsHeaders)
        
        val localVariableConfig = RequestConfig(
            RequestMethod.GET,
            "/pet/findByTags",
            query = localVariableQuery,
            headers = localVariableHeaders
        )
        val response = request<kotlin.Array<Pet>>(
            localVariableConfig,
            localVariableBody
        )

        return when (response.responseType) {
            ResponseType.Success -> (response as Success<*>).data as kotlin.Array<Pet>
            ResponseType.Informational -> TODO()
            ResponseType.Redirection -> TODO()
            ResponseType.ClientError -> throw ClientException((response as ClientError<*>).body as? String ?: "Client error")
            ResponseType.ServerError -> throw ServerException((response as ServerError<*>).message ?: "Server error")
            else -> throw kotlin.IllegalStateException("Undefined ResponseType.")
        }
    }

    /**
    * Find pet by ID
    * Returns a single pet
    * @param petId ID of pet to return 
    * @return Pet
    */
    @Suppress("UNCHECKED_CAST")
    fun getPetById(petId: kotlin.Long) : Pet {
        val localVariableBody: kotlin.Any? = null
        val localVariableQuery: MultiValueMap = mapOf()
        
        val contentHeaders: kotlin.collections.Map<kotlin.String,kotlin.String> = mapOf()
        val acceptsHeaders: kotlin.collections.Map<kotlin.String,kotlin.String> = mapOf("Accept" to "application/xml, application/json")
        val localVariableHeaders: kotlin.collections.MutableMap<kotlin.String,kotlin.String> = mutableMapOf()
        localVariableHeaders.putAll(contentHeaders)
        localVariableHeaders.putAll(acceptsHeaders)
        
        val localVariableConfig = RequestConfig(
            RequestMethod.GET,
            "/pet/{petId}".replace("{"+"petId"+"}", "$petId"),
            query = localVariableQuery,
            headers = localVariableHeaders
        )
        val response = request<Pet>(
            localVariableConfig,
            localVariableBody
        )

        return when (response.responseType) {
            ResponseType.Success -> (response as Success<*>).data as Pet
            ResponseType.Informational -> TODO()
            ResponseType.Redirection -> TODO()
            ResponseType.ClientError -> throw ClientException((response as ClientError<*>).body as? String ?: "Client error")
            ResponseType.ServerError -> throw ServerException((response as ServerError<*>).message ?: "Server error")
            else -> throw kotlin.IllegalStateException("Undefined ResponseType.")
        }
    }

    /**
    * Update an existing pet
    * 
    * @param body Pet object that needs to be added to the store 
    * @return void
    */
    fun updatePet(body: Pet) : Unit {
        val localVariableBody: kotlin.Any? = body
        val localVariableQuery: MultiValueMap = mapOf()
        
        val contentHeaders: kotlin.collections.Map<kotlin.String,kotlin.String> = mapOf()
        val acceptsHeaders: kotlin.collections.Map<kotlin.String,kotlin.String> = mapOf("Accept" to "application/xml, application/json")
        val localVariableHeaders: kotlin.collections.MutableMap<kotlin.String,kotlin.String> = mutableMapOf()
        localVariableHeaders.putAll(contentHeaders)
        localVariableHeaders.putAll(acceptsHeaders)
        
        val localVariableConfig = RequestConfig(
            RequestMethod.PUT,
            "/pet",
            query = localVariableQuery,
            headers = localVariableHeaders
        )
        val response = request<Any?>(
            localVariableConfig,
            localVariableBody
        )

        return when (response.responseType) {
            ResponseType.Success -> Unit
            ResponseType.Informational -> TODO()
            ResponseType.Redirection -> TODO()
            ResponseType.ClientError -> throw ClientException((response as ClientError<*>).body as? String ?: "Client error")
            ResponseType.ServerError -> throw ServerException((response as ServerError<*>).message ?: "Server error")
            else -> throw kotlin.IllegalStateException("Undefined ResponseType.")
        }
    }

    /**
    * Updates a pet in the store with form data
    * 
    * @param petId ID of pet that needs to be updated 
    * @param name Updated name of the pet (optional)
    * @param status Updated status of the pet (optional)
    * @return void
    */
    fun updatePetWithForm(petId: kotlin.Long, name: kotlin.String, status: kotlin.String) : Unit {
        val localVariableBody: kotlin.Any? = mapOf("name" to "$name", "status" to "$status")
        val localVariableQuery: MultiValueMap = mapOf()
        
        val contentHeaders: kotlin.collections.Map<kotlin.String,kotlin.String> = mapOf("Content-Type" to "multipart/form-data")
        val acceptsHeaders: kotlin.collections.Map<kotlin.String,kotlin.String> = mapOf("Accept" to "application/xml, application/json")
        val localVariableHeaders: kotlin.collections.MutableMap<kotlin.String,kotlin.String> = mutableMapOf()
        localVariableHeaders.putAll(contentHeaders)
        localVariableHeaders.putAll(acceptsHeaders)
        
        val localVariableConfig = RequestConfig(
            RequestMethod.POST,
            "/pet/{petId}".replace("{"+"petId"+"}", "$petId"),
            query = localVariableQuery,
            headers = localVariableHeaders
        )
        val response = request<Any?>(
            localVariableConfig,
            localVariableBody
        )

        return when (response.responseType) {
            ResponseType.Success -> Unit
            ResponseType.Informational -> TODO()
            ResponseType.Redirection -> TODO()
            ResponseType.ClientError -> throw ClientException((response as ClientError<*>).body as? String ?: "Client error")
            ResponseType.ServerError -> throw ServerException((response as ServerError<*>).message ?: "Server error")
            else -> throw kotlin.IllegalStateException("Undefined ResponseType.")
        }
    }

    /**
    * uploads an image
    * 
    * @param petId ID of pet to update 
    * @param additionalMetadata Additional data to pass to server (optional)
    * @param file file to upload (optional)
    * @return ApiResponse
    */
    @Suppress("UNCHECKED_CAST")
    fun uploadFile(petId: kotlin.Long, additionalMetadata: kotlin.String, file: java.io.File) : ApiResponse {
        val localVariableBody: kotlin.Any? = mapOf("additionalMetadata" to "$additionalMetadata", "file" to "$file")
        val localVariableQuery: MultiValueMap = mapOf()
        
        val contentHeaders: kotlin.collections.Map<kotlin.String,kotlin.String> = mapOf("Content-Type" to "multipart/form-data")
        val acceptsHeaders: kotlin.collections.Map<kotlin.String,kotlin.String> = mapOf("Accept" to "application/json")
        val localVariableHeaders: kotlin.collections.MutableMap<kotlin.String,kotlin.String> = mutableMapOf()
        localVariableHeaders.putAll(contentHeaders)
        localVariableHeaders.putAll(acceptsHeaders)
        
        val localVariableConfig = RequestConfig(
            RequestMethod.POST,
            "/pet/{petId}/uploadImage".replace("{"+"petId"+"}", "$petId"),
            query = localVariableQuery,
            headers = localVariableHeaders
        )
        val response = request<ApiResponse>(
            localVariableConfig,
            localVariableBody
        )

        return when (response.responseType) {
            ResponseType.Success -> (response as Success<*>).data as ApiResponse
            ResponseType.Informational -> TODO()
            ResponseType.Redirection -> TODO()
            ResponseType.ClientError -> throw ClientException((response as ClientError<*>).body as? String ?: "Client error")
            ResponseType.ServerError -> throw ServerException((response as ServerError<*>).message ?: "Server error")
            else -> throw kotlin.IllegalStateException("Undefined ResponseType.")
        }
    }

}