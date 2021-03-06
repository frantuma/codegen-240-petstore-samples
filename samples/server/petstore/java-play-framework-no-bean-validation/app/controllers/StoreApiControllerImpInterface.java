package controllers;

import java.util.Map;
import apimodels.Order;

import play.mvc.Http;
import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;


@SuppressWarnings("RedundantThrows")
public interface StoreApiControllerImpInterface {
    void deleteOrder(Long orderId) throws Exception;

    Map<String, Integer> getInventory() throws Exception;

    Order getOrderById(Long orderId) throws Exception;

    Order placeOrder(Order body) throws Exception;

}
