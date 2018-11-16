import io.swagger.client.api.PetApi;
import io.swagger.client.api.UserApi;
import io.swagger.client.model.Pet;
import io.swagger.util.Yaml;
import org.testng.annotations.Test;

import java.util.Collections;
import java.util.List;


public class TestRestEasy {

    @Test
    public void test() throws Exception {
        /*PetApi api  = new PetApi();
        List<Pet> a = api.findPetsByStatus(Collections.singletonList("available"));
        Yaml.prettyPrint(a.size());
        api.addPet(new Pet().id(1L).name("name").status(Pet.StatusEnum.AVAILABLE));
        UserApi userApi = new UserApi();
        try {
            Yaml.prettyPrint(userApi.loginUser("user1", "XXXXXXXXXXX"));
        } catch (Exception ex) {
            //ok
        }*/
    }
}
