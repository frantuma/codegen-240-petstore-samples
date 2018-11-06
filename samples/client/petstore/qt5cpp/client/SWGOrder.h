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

/*
 * SWGOrder.h
 *
 * 
 */

#ifndef SWGOrder_H_
#define SWGOrder_H_

#include <QJsonObject>


#include <QDateTime>
#include <QString>

#include "SWGObject.h"

namespace Swagger {

class SWGOrder: public SWGObject {
public:
    SWGOrder();
    SWGOrder(QString json);
    ~SWGOrder();
    void init();
    void cleanup();

    QString asJson () override;
    QJsonObject asJsonObject() override;
    void fromJsonObject(QJsonObject json) override;
    SWGOrder* fromJson(QString jsonString) override;

    qint64 getId();
    void setId(qint64 id);

    qint64 getPetId();
    void setPetId(qint64 pet_id);

    qint32 getQuantity();
    void setQuantity(qint32 quantity);

    QDateTime* getShipDate();
    void setShipDate(QDateTime* ship_date);

    QString* getStatus();
    void setStatus(QString* status);

    bool isComplete();
    void setComplete(bool complete);


    virtual bool isSet() override;

private:
    qint64 id;
    bool m_id_isSet;

    qint64 pet_id;
    bool m_pet_id_isSet;

    qint32 quantity;
    bool m_quantity_isSet;

    QDateTime* ship_date;
    bool m_ship_date_isSet;

    QString* status;
    bool m_status_isSet;

    bool complete;
    bool m_complete_isSet;

};

}

#endif /* SWGOrder_H_ */
