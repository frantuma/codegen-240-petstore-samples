/*
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


package io.swagger.client.api;

import io.swagger.client.model.User;
import io.swagger.client.ApiClient;
import io.swagger.client.api.UserApi;
import io.restassured.builder.RequestSpecBuilder;
import io.restassured.filter.log.ErrorLoggingFilter;
import org.junit.Before;
import org.junit.Test;
import org.junit.Ignore;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import static io.restassured.config.ObjectMapperConfig.objectMapperConfig;
import static io.restassured.config.RestAssuredConfig.config;
import static io.swagger.client.GsonObjectMapper.gson;

/**
 * API tests for UserApi
 */
@Ignore
public class UserApiTest {

    private UserApi api;

    @Before
    public void createApi() {
        api = ApiClient.api(ApiClient.Config.apiConfig().reqSpecSupplier(
                () -> new RequestSpecBuilder().setConfig(config().objectMapperConfig(objectMapperConfig().defaultObjectMapper(gson())))
                        .addFilter(new ErrorLoggingFilter())
                        .setBaseUri("https://petstore.swagger.io/v2"))).user();
    }

    /**
     * successful operation
     */
    @Test
    public void shouldSee0AfterCreateUser() {
        User body = null;
        api.createUser()
                .body(body).execute(r -> r.prettyPeek());
        // TODO: test validations
    }


    /**
     * successful operation
     */
    @Test
    public void shouldSee0AfterCreateUsersWithArrayInput() {
        List<User> body = null;
        api.createUsersWithArrayInput()
                .body(body).execute(r -> r.prettyPeek());
        // TODO: test validations
    }


    /**
     * successful operation
     */
    @Test
    public void shouldSee0AfterCreateUsersWithListInput() {
        List<User> body = null;
        api.createUsersWithListInput()
                .body(body).execute(r -> r.prettyPeek());
        // TODO: test validations
    }


    /**
     * Invalid username supplied
     */
    @Test
    public void shouldSee400AfterDeleteUser() {
        String username = null;
        api.deleteUser()
                .usernamePath(username).execute(r -> r.prettyPeek());
        // TODO: test validations
    }

    /**
     * User not found
     */
    @Test
    public void shouldSee404AfterDeleteUser() {
        String username = null;
        api.deleteUser()
                .usernamePath(username).execute(r -> r.prettyPeek());
        // TODO: test validations
    }


    /**
     * successful operation
     */
    @Test
    public void shouldSee200AfterGetUserByName() {
        String username = null;
        api.getUserByName()
                .usernamePath(username).execute(r -> r.prettyPeek());
        // TODO: test validations
    }

    /**
     * Invalid username supplied
     */
    @Test
    public void shouldSee400AfterGetUserByName() {
        String username = null;
        api.getUserByName()
                .usernamePath(username).execute(r -> r.prettyPeek());
        // TODO: test validations
    }

    /**
     * User not found
     */
    @Test
    public void shouldSee404AfterGetUserByName() {
        String username = null;
        api.getUserByName()
                .usernamePath(username).execute(r -> r.prettyPeek());
        // TODO: test validations
    }


    /**
     * successful operation
     */
    @Test
    public void shouldSee200AfterLoginUser() {
        String username = null;
        String password = null;
        api.loginUser()
                .usernameQuery(username)
                .passwordQuery(password).execute(r -> r.prettyPeek());
        // TODO: test validations
    }

    /**
     * Invalid username/password supplied
     */
    @Test
    public void shouldSee400AfterLoginUser() {
        String username = null;
        String password = null;
        api.loginUser()
                .usernameQuery(username)
                .passwordQuery(password).execute(r -> r.prettyPeek());
        // TODO: test validations
    }


    /**
     * successful operation
     */
    @Test
    public void shouldSee0AfterLogoutUser() {
        api.logoutUser().execute(r -> r.prettyPeek());
        // TODO: test validations
    }


    /**
     * Invalid user supplied
     */
    @Test
    public void shouldSee400AfterUpdateUser() {
        String username = null;
        User body = null;
        api.updateUser()
                .usernamePath(username)
                .body(body).execute(r -> r.prettyPeek());
        // TODO: test validations
    }

    /**
     * User not found
     */
    @Test
    public void shouldSee404AfterUpdateUser() {
        String username = null;
        User body = null;
        api.updateUser()
                .usernamePath(username)
                .body(body).execute(r -> r.prettyPeek());
        // TODO: test validations
    }

}