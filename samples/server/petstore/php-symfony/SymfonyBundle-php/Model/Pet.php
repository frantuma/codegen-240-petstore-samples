<?php
/**
 * Pet
 *
 * PHP version 5
 *
 * @category Class
 * @package  Swagger\Server\Model
 * @author   Swagger Codegen team
 * @link     https://github.com/swagger-api/swagger-codegen
 */

/**
 * Swagger Petstore
 *
 * This is a sample server Petstore server.  You can find out more about Swagger at [http://swagger.io](http://swagger.io) or on [irc.freenode.net, #swagger](http://swagger.io/irc/).  For this sample, you can use the api key `special-key` to test the authorization filters.
 *
 * OpenAPI spec version: 1.0.0
 * Contact: apiteam@swagger.io
 * Generated by: https://github.com/swagger-api/swagger-codegen.git
 *
 */

/**
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen
 * Do not edit the class manually.
 */

namespace Swagger\Server\Model;

use Symfony\Component\Validator\Constraints as Assert;
use JMS\Serializer\Annotation\Type;
use JMS\Serializer\Annotation\SerializedName;

/**
 * Class representing the Pet model.
 *
 * @package Swagger\Server\Model
 * @author  Swagger Codegen team
 */
class Pet 
{
        /**
     * @var int|null
     * @SerializedName("id")
     * @Assert\Type("int")
     * @Type("int")
     */
    protected $id;

    /**
     * @var Swagger\Server\Model\Category|null
     * @SerializedName("category")
     * @Assert\Type("Swagger\Server\Model\Category")
     * @Type("Swagger\Server\Model\Category")
     */
    protected $category;

    /**
     * @var string
     * @SerializedName("name")
     * @Assert\NotNull()
     * @Assert\Type("string")
     * @Type("string")
     */
    protected $name;

    /**
     * @var string[]
     * @SerializedName("photoUrls")
     * @Assert\NotNull()
     * @Assert\All({
     *   @Assert\Type("string")
     * })
     * @Type("array<string>")
     */
    protected $photoUrls;

    /**
     * @var Swagger\Server\Model\Tag[]|null
     * @SerializedName("tags")
     * @Assert\All({
     *   @Assert\Type("Swagger\Server\Model\Tag")
     * })
     * @Type("array<Swagger\Server\Model\Tag>")
     */
    protected $tags;

    /**
     * pet status in the store
     *
     * @var string|null
     * @SerializedName("status")
     * @Assert\Choice({ "available", "pending", "sold" })
     * @Assert\Type("string")
     * @Type("string")
     */
    protected $status;

    /**
     * Constructor
     * @param mixed[] $data Associated array of property values initializing the model
     */
    public function __construct(array $data = null)
    {
        $this->id = isset($data['id']) ? $data['id'] : null;
        $this->category = isset($data['category']) ? $data['category'] : null;
        $this->name = isset($data['name']) ? $data['name'] : null;
        $this->photoUrls = isset($data['photoUrls']) ? $data['photoUrls'] : null;
        $this->tags = isset($data['tags']) ? $data['tags'] : null;
        $this->status = isset($data['status']) ? $data['status'] : null;
    }

    /**
     * Gets id.
     *
     * @return int|null
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Sets id.
     *
     * @param int|null $id
     *
     * @return $this
     */
    public function setId($id = null)
    {
        $this->id = $id;

        return $this;
    }

    /**
     * Gets category.
     *
     * @return Swagger\Server\Model\Category|null
     */
    public function getCategory()
    {
        return $this->category;
    }

    /**
     * Sets category.
     *
     * @param Swagger\Server\Model\Category|null $category
     *
     * @return $this
     */
    public function setCategory(Category $category = null)
    {
        $this->category = $category;

        return $this;
    }

    /**
     * Gets name.
     *
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Sets name.
     *
     * @param string $name
     *
     * @return $this
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Gets photoUrls.
     *
     * @return string[]
     */
    public function getPhotoUrls()
    {
        return $this->photoUrls;
    }

    /**
     * Sets photoUrls.
     *
     * @param string[] $photoUrls
     *
     * @return $this
     */
    public function setPhotoUrls($photoUrls)
    {
        $this->photoUrls = $photoUrls;

        return $this;
    }

    /**
     * Gets tags.
     *
     * @return Swagger\Server\Model\Tag[]|null
     */
    public function getTags()
    {
        return $this->tags;
    }

    /**
     * Sets tags.
     *
     * @param Swagger\Server\Model\Tag[]|null $tags
     *
     * @return $this
     */
    public function setTags(Tag $tags = null)
    {
        $this->tags = $tags;

        return $this;
    }

    /**
     * Gets status.
     *
     * @return string|null
     */
    public function getStatus()
    {
        return $this->status;
    }

    /**
     * Sets status.
     *
     * @param string|null $status  pet status in the store
     *
     * @return $this
     */
    public function setStatus($status = null)
    {
        $this->status = $status;

        return $this;
    }
}


