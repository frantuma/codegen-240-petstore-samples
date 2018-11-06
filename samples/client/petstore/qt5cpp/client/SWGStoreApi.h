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

#ifndef _SWG_SWGStoreApi_H_
#define _SWG_SWGStoreApi_H_

#include "SWGHttpRequest.h"

#include <QMap>
#include "SWGOrder.h"

#include <QObject>

namespace Swagger {

class SWGStoreApi: public QObject {
    Q_OBJECT

public:
    SWGStoreApi();
    SWGStoreApi(QString host, QString basePath);
    ~SWGStoreApi();

    QString host;
    QString basePath;
    QMap<QString, QString> defaultHeaders;

    void deleteOrder(qint64 order_id);
    void getInventory();
    void getOrderById(qint64 order_id);
    void placeOrder(SWGOrder& body);
    
private:
    void deleteOrderCallback (SWGHttpRequestWorker * worker);
    void getInventoryCallback (SWGHttpRequestWorker * worker);
    void getOrderByIdCallback (SWGHttpRequestWorker * worker);
    void placeOrderCallback (SWGHttpRequestWorker * worker);
    
signals:
    void deleteOrderSignal();
    void getInventorySignal(QMap<QString, qint32>* summary);
    void getOrderByIdSignal(SWGOrder* summary);
    void placeOrderSignal(SWGOrder* summary);
    
    void deleteOrderSignalE(QNetworkReply::NetworkError error_type, QString& error_str);
    void getInventorySignalE(QMap<QString, qint32>* summary, QNetworkReply::NetworkError error_type, QString& error_str);
    void getOrderByIdSignalE(SWGOrder* summary, QNetworkReply::NetworkError error_type, QString& error_str);
    void placeOrderSignalE(SWGOrder* summary, QNetworkReply::NetworkError error_type, QString& error_str);
    
    void deleteOrderSignalEFull(SWGHttpRequestWorker* worker, QNetworkReply::NetworkError error_type, QString& error_str);
    void getInventorySignalEFull(SWGHttpRequestWorker* worker, QNetworkReply::NetworkError error_type, QString& error_str);
    void getOrderByIdSignalEFull(SWGHttpRequestWorker* worker, QNetworkReply::NetworkError error_type, QString& error_str);
    void placeOrderSignalEFull(SWGHttpRequestWorker* worker, QNetworkReply::NetworkError error_type, QString& error_str);
    
};

}
#endif
