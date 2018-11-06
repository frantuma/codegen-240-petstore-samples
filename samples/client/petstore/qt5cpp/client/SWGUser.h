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
 * SWGUser.h
 *
 * 
 */

#ifndef SWGUser_H_
#define SWGUser_H_

#include <QJsonObject>


#include <QString>

#include "SWGObject.h"

namespace Swagger {

class SWGUser: public SWGObject {
public:
    SWGUser();
    SWGUser(QString json);
    ~SWGUser();
    void init();
    void cleanup();

    QString asJson () override;
    QJsonObject asJsonObject() override;
    void fromJsonObject(QJsonObject json) override;
    SWGUser* fromJson(QString jsonString) override;

    qint64 getId();
    void setId(qint64 id);

    QString* getUsername();
    void setUsername(QString* username);

    QString* getFirstName();
    void setFirstName(QString* first_name);

    QString* getLastName();
    void setLastName(QString* last_name);

    QString* getEmail();
    void setEmail(QString* email);

    QString* getPassword();
    void setPassword(QString* password);

    QString* getPhone();
    void setPhone(QString* phone);

    qint32 getUserStatus();
    void setUserStatus(qint32 user_status);


    virtual bool isSet() override;

private:
    qint64 id;
    bool m_id_isSet;

    QString* username;
    bool m_username_isSet;

    QString* first_name;
    bool m_first_name_isSet;

    QString* last_name;
    bool m_last_name_isSet;

    QString* email;
    bool m_email_isSet;

    QString* password;
    bool m_password_isSet;

    QString* phone;
    bool m_phone_isSet;

    qint32 user_status;
    bool m_user_status_isSet;

};

}

#endif /* SWGUser_H_ */