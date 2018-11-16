import io.swagger.client.api.PetApi;
//import io.swagger.client.api.PetApiImpl;
import io.swagger.client.api.UserApi;
//import io.swagger.client.api.UserApxiImpl;
import io.swagger.client.model.Pet;
import io.swagger.util.Yaml;
import org.testng.annotations.Test;

import java.util.Collections;
import java.util.List;


public class TestVertx {

    @Test
    public void test() throws Exception {
        /*PetApi api  = new PetApiImpl();
        List<Pet> a = api.findPetsByStatus(Collections.singletonList("available"), null);
        Yaml.prettyPrint(a.size());
        api.addPet(new Pet().id(1L).name("name").status(Pet.StatusEnum.AVAILABLE));
        UserApi userApi = new UserApiImpl();
        Yaml.prettyPrint(userApi.loginUser("user1", "XXXXXXXXXXX"));*/
    }
}
