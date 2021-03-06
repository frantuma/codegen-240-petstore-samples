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
 * ApiResponse.h
 *
 * 
 */

#ifndef ApiResponse_H_
#define ApiResponse_H_


#include "ModelBase.h"

#include <string>

namespace io {
namespace swagger {
namespace server {
namespace model {

/// <summary>
/// 
/// </summary>
class  ApiResponse
    : public ModelBase
{
public:
    ApiResponse();
    virtual ~ApiResponse();

    /////////////////////////////////////////////
    /// ModelBase overrides

    void validate() override;

    nlohmann::json toJson() const override;
    void fromJson(nlohmann::json& json) override;

    /////////////////////////////////////////////
    /// ApiResponse members

    /// <summary>
    /// 
    /// </summary>
    int32_t getCode() const;
    void setCode(int32_t value);
    bool codeIsSet() const;
    void unsetCode();
    /// <summary>
    /// 
    /// </summary>
    std::string getType() const;
    void setType(std::string value);
    bool typeIsSet() const;
    void unsetType();
    /// <summary>
    /// 
    /// </summary>
    std::string getMessage() const;
    void setMessage(std::string value);
    bool messageIsSet() const;
    void unsetMessage();

protected:
    int32_t m_Code;
    bool m_CodeIsSet;
    std::string m_Type;
    bool m_TypeIsSet;
    std::string m_Message;
    bool m_MessageIsSet;
};

}
}
}
}

#endif /* ApiResponse_H_ */
