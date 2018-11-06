--  Swagger Petstore
--  This is a sample server Petstore server.  You can find out more about Swagger at [http://swagger.io](http://swagger.io) or on [irc.freenode.net, #swagger](http://swagger.io/irc/).  For this sample, you can use the api key `special_key` to test the authorization filters.
--
--  OpenAPI spec version: 1.0.0
--  Contact: apiteam@swagger.io
--
--  NOTE: This package is auto generated by the swagger code generator 2.4.0-SNAPSHOT.
--  https://github.com/swagger-api/swagger-codegen.git
--  Do not edit the class manually.

package body Samples.Petstore.Models is

   use Swagger.Streams;



   procedure Serialize (Into  : in out Swagger.Streams.Output_Stream'Class;
                        Name  : in String;
                        Value : in Tag_Type) is
   begin
      Into.Start_Entity (Name);
      Serialize (Into, "id", Value.Id);
      Into.Write_Entity ("name", Value.Name);
      Into.End_Entity (Name);
   end Serialize;

   procedure Serialize (Into  : in out Swagger.Streams.Output_Stream'Class;
                        Name  : in String;
                        Value : in Tag_Type_Vectors.Vector) is
   begin
      Into.Start_Array (Name);
      for Item of Value loop
         Serialize (Into, "", Item);
      end loop;
      Into.End_Array (Name);
   end Serialize;

   procedure Deserialize (From  : in Swagger.Value_Type;
                          Name  : in String;
                          Value : out Tag_Type) is
      Object : Swagger.Value_Type;
   begin
      Swagger.Streams.Deserialize (From, Name, Object);
      Swagger.Streams.Deserialize (Object, "id", Value.Id);
      Swagger.Streams.Deserialize (Object, "name", Value.Name);
   end Deserialize;

   procedure Deserialize (From  : in Swagger.Value_Type;
                          Name  : in String;
                          Value : out Tag_Type_Vectors.Vector) is
      List : Swagger.Value_Array_Type;
      Item : Tag_Type;
   begin
      Value.Clear;
      Swagger.Streams.Deserialize (From, Name, List);
      for Data of List loop
         Deserialize (Data, "", Item);
         Value.Append (Item);
      end loop;
   end Deserialize;




   procedure Serialize (Into  : in out Swagger.Streams.Output_Stream'Class;
                        Name  : in String;
                        Value : in User_Type) is
   begin
      Into.Start_Entity (Name);
      Serialize (Into, "id", Value.Id);
      Into.Write_Entity ("username", Value.Username);
      Into.Write_Entity ("firstName", Value.First_Name);
      Into.Write_Entity ("lastName", Value.Last_Name);
      Into.Write_Entity ("email", Value.Email);
      Into.Write_Entity ("password", Value.Password);
      Into.Write_Entity ("phone", Value.Phone);
      Into.Write_Entity ("userStatus", Value.User_Status);
      Into.End_Entity (Name);
   end Serialize;

   procedure Serialize (Into  : in out Swagger.Streams.Output_Stream'Class;
                        Name  : in String;
                        Value : in User_Type_Vectors.Vector) is
   begin
      Into.Start_Array (Name);
      for Item of Value loop
         Serialize (Into, "", Item);
      end loop;
      Into.End_Array (Name);
   end Serialize;

   procedure Deserialize (From  : in Swagger.Value_Type;
                          Name  : in String;
                          Value : out User_Type) is
      Object : Swagger.Value_Type;
   begin
      Swagger.Streams.Deserialize (From, Name, Object);
      Swagger.Streams.Deserialize (Object, "id", Value.Id);
      Swagger.Streams.Deserialize (Object, "username", Value.Username);
      Swagger.Streams.Deserialize (Object, "firstName", Value.First_Name);
      Swagger.Streams.Deserialize (Object, "lastName", Value.Last_Name);
      Swagger.Streams.Deserialize (Object, "email", Value.Email);
      Swagger.Streams.Deserialize (Object, "password", Value.Password);
      Swagger.Streams.Deserialize (Object, "phone", Value.Phone);
      Swagger.Streams.Deserialize (Object, "userStatus", Value.User_Status);
   end Deserialize;

   procedure Deserialize (From  : in Swagger.Value_Type;
                          Name  : in String;
                          Value : out User_Type_Vectors.Vector) is
      List : Swagger.Value_Array_Type;
      Item : User_Type;
   begin
      Value.Clear;
      Swagger.Streams.Deserialize (From, Name, List);
      for Data of List loop
         Deserialize (Data, "", Item);
         Value.Append (Item);
      end loop;
   end Deserialize;




   procedure Serialize (Into  : in out Swagger.Streams.Output_Stream'Class;
                        Name  : in String;
                        Value : in Category_Type) is
   begin
      Into.Start_Entity (Name);
      Serialize (Into, "id", Value.Id);
      Into.Write_Entity ("name", Value.Name);
      Into.End_Entity (Name);
   end Serialize;

   procedure Serialize (Into  : in out Swagger.Streams.Output_Stream'Class;
                        Name  : in String;
                        Value : in Category_Type_Vectors.Vector) is
   begin
      Into.Start_Array (Name);
      for Item of Value loop
         Serialize (Into, "", Item);
      end loop;
      Into.End_Array (Name);
   end Serialize;

   procedure Deserialize (From  : in Swagger.Value_Type;
                          Name  : in String;
                          Value : out Category_Type) is
      Object : Swagger.Value_Type;
   begin
      Swagger.Streams.Deserialize (From, Name, Object);
      Swagger.Streams.Deserialize (Object, "id", Value.Id);
      Swagger.Streams.Deserialize (Object, "name", Value.Name);
   end Deserialize;

   procedure Deserialize (From  : in Swagger.Value_Type;
                          Name  : in String;
                          Value : out Category_Type_Vectors.Vector) is
      List : Swagger.Value_Array_Type;
      Item : Category_Type;
   begin
      Value.Clear;
      Swagger.Streams.Deserialize (From, Name, List);
      for Data of List loop
         Deserialize (Data, "", Item);
         Value.Append (Item);
      end loop;
   end Deserialize;




   procedure Serialize (Into  : in out Swagger.Streams.Output_Stream'Class;
                        Name  : in String;
                        Value : in Pet_Type) is
   begin
      Into.Start_Entity (Name);
      Serialize (Into, "id", Value.Id);
      Serialize (Into, "category", Value.Category);
      Into.Write_Entity ("name", Value.Name);
      Serialize (Into, "photoUrls", Value.Photo_Urls);
      Serialize (Into, "tags", Value.Tags);
      Into.Write_Entity ("status", Value.Status);
      Into.End_Entity (Name);
   end Serialize;

   procedure Serialize (Into  : in out Swagger.Streams.Output_Stream'Class;
                        Name  : in String;
                        Value : in Pet_Type_Vectors.Vector) is
   begin
      Into.Start_Array (Name);
      for Item of Value loop
         Serialize (Into, "", Item);
      end loop;
      Into.End_Array (Name);
   end Serialize;

   procedure Deserialize (From  : in Swagger.Value_Type;
                          Name  : in String;
                          Value : out Pet_Type) is
      Object : Swagger.Value_Type;
   begin
      Swagger.Streams.Deserialize (From, Name, Object);
      Swagger.Streams.Deserialize (Object, "id", Value.Id);
      Deserialize (Object, "category", Value.Category);
      Swagger.Streams.Deserialize (Object, "name", Value.Name);
      Swagger.Streams.Deserialize (Object, "photoUrls", Value.Photo_Urls);
      Deserialize (Object, "tags", Value.Tags);
      Swagger.Streams.Deserialize (Object, "status", Value.Status);
   end Deserialize;

   procedure Deserialize (From  : in Swagger.Value_Type;
                          Name  : in String;
                          Value : out Pet_Type_Vectors.Vector) is
      List : Swagger.Value_Array_Type;
      Item : Pet_Type;
   begin
      Value.Clear;
      Swagger.Streams.Deserialize (From, Name, List);
      for Data of List loop
         Deserialize (Data, "", Item);
         Value.Append (Item);
      end loop;
   end Deserialize;




   procedure Serialize (Into  : in out Swagger.Streams.Output_Stream'Class;
                        Name  : in String;
                        Value : in ApiResponse_Type) is
   begin
      Into.Start_Entity (Name);
      Into.Write_Entity ("code", Value.Code);
      Into.Write_Entity ("type", Value.P_Type);
      Into.Write_Entity ("message", Value.Message);
      Into.End_Entity (Name);
   end Serialize;

   procedure Serialize (Into  : in out Swagger.Streams.Output_Stream'Class;
                        Name  : in String;
                        Value : in ApiResponse_Type_Vectors.Vector) is
   begin
      Into.Start_Array (Name);
      for Item of Value loop
         Serialize (Into, "", Item);
      end loop;
      Into.End_Array (Name);
   end Serialize;

   procedure Deserialize (From  : in Swagger.Value_Type;
                          Name  : in String;
                          Value : out ApiResponse_Type) is
      Object : Swagger.Value_Type;
   begin
      Swagger.Streams.Deserialize (From, Name, Object);
      Swagger.Streams.Deserialize (Object, "code", Value.Code);
      Swagger.Streams.Deserialize (Object, "type", Value.P_Type);
      Swagger.Streams.Deserialize (Object, "message", Value.Message);
   end Deserialize;

   procedure Deserialize (From  : in Swagger.Value_Type;
                          Name  : in String;
                          Value : out ApiResponse_Type_Vectors.Vector) is
      List : Swagger.Value_Array_Type;
      Item : ApiResponse_Type;
   begin
      Value.Clear;
      Swagger.Streams.Deserialize (From, Name, List);
      for Data of List loop
         Deserialize (Data, "", Item);
         Value.Append (Item);
      end loop;
   end Deserialize;




   procedure Serialize (Into  : in out Swagger.Streams.Output_Stream'Class;
                        Name  : in String;
                        Value : in Order_Type) is
   begin
      Into.Start_Entity (Name);
      Serialize (Into, "id", Value.Id);
      Serialize (Into, "petId", Value.Pet_Id);
      Into.Write_Entity ("quantity", Value.Quantity);
      Into.Write_Entity ("shipDate", Value.Ship_Date);
      Into.Write_Entity ("status", Value.Status);
      Into.Write_Entity ("complete", Value.Complete);
      Into.End_Entity (Name);
   end Serialize;

   procedure Serialize (Into  : in out Swagger.Streams.Output_Stream'Class;
                        Name  : in String;
                        Value : in Order_Type_Vectors.Vector) is
   begin
      Into.Start_Array (Name);
      for Item of Value loop
         Serialize (Into, "", Item);
      end loop;
      Into.End_Array (Name);
   end Serialize;

   procedure Deserialize (From  : in Swagger.Value_Type;
                          Name  : in String;
                          Value : out Order_Type) is
      Object : Swagger.Value_Type;
   begin
      Swagger.Streams.Deserialize (From, Name, Object);
      Swagger.Streams.Deserialize (Object, "id", Value.Id);
      Swagger.Streams.Deserialize (Object, "petId", Value.Pet_Id);
      Swagger.Streams.Deserialize (Object, "quantity", Value.Quantity);
      Deserialize (Object, "shipDate", Value.Ship_Date);
      Swagger.Streams.Deserialize (Object, "status", Value.Status);
      Swagger.Streams.Deserialize (Object, "complete", Value.Complete);
   end Deserialize;

   procedure Deserialize (From  : in Swagger.Value_Type;
                          Name  : in String;
                          Value : out Order_Type_Vectors.Vector) is
      List : Swagger.Value_Array_Type;
      Item : Order_Type;
   begin
      Value.Clear;
      Swagger.Streams.Deserialize (From, Name, List);
      for Data of List loop
         Deserialize (Data, "", Item);
         Value.Append (Item);
      end loop;
   end Deserialize;



end Samples.Petstore.Models;
