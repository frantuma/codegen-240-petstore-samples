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
 * Pet.h
 *
 * 
 */

#ifndef Pet_H_
#define Pet_H_


#include "ModelBase.h"

#include "Tag.h"
#include <string>
#include "Category.h"
#include <vector>

namespace io {
namespace swagger {
namespace server {
namespace model {

/// <summary>
/// 
/// </summary>
class  Pet
    : public ModelBase
{
public:
    Pet();
    virtual ~Pet();

    /////////////////////////////////////////////
    /// ModelBase overrides

    void validate() override;

    nlohmann::json toJson() const override;
    void fromJson(nlohmann::json& json) override;

    /////////////////////////////////////////////
    /// Pet members

    /// <summary>
    /// 
    /// </summary>
    int64_t getId() const;
    void setId(int64_t value);
    bool idIsSet() const;
    void unsetId();
    /// <summary>
    /// 
    /// </summary>
    std::shared_ptr<Category> getCategory() const;
    void setCategory(std::shared_ptr<Category> value);
    bool categoryIsSet() const;
    void unsetCategory();
    /// <summary>
    /// 
    /// </summary>
    std::string getName() const;
    void setName(std::string value);
        /// <summary>
    /// 
    /// </summary>
    std::vector<std::string>& getPhotoUrls();
        /// <summary>
    /// 
    /// </summary>
    std::vector<std::shared_ptr<Tag>>& getTags();
    bool tagsIsSet() const;
    void unsetTags();
    /// <summary>
    /// pet status in the store
    /// </summary>
    std::string getStatus() const;
    void setStatus(std::string value);
    bool statusIsSet() const;
    void unsetStatus();

protected:
    int64_t m_Id;
    bool m_IdIsSet;
    std::shared_ptr<Category> m_Category;
    bool m_CategoryIsSet;
    std::string m_Name;

    std::vector<std::string> m_PhotoUrls;

    std::vector<std::shared_ptr<Tag>> m_Tags;
    bool m_TagsIsSet;
    std::string m_Status;
    bool m_StatusIsSet;
};

}
}
}
}

#endif /* Pet_H_ */
