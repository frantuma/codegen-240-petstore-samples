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
 * SWGTag.h
 *
 * 
 */

#ifndef SWGTag_H_
#define SWGTag_H_

#include <QJsonObject>


#include <QString>

#include "SWGObject.h"

namespace Swagger {

class SWGTag: public SWGObject {
public:
    SWGTag();
    SWGTag(QString json);
    ~SWGTag();
    void init();
    void cleanup();

    QString asJson () override;
    QJsonObject asJsonObject() override;
    void fromJsonObject(QJsonObject json) override;
    SWGTag* fromJson(QString jsonString) override;

    qint64 getId();
    void setId(qint64 id);

    QString* getName();
    void setName(QString* name);


    virtual bool isSet() override;

private:
    qint64 id;
    bool m_id_isSet;

    QString* name;
    bool m_name_isSet;

};

}

#endif /* SWGTag_H_ */
