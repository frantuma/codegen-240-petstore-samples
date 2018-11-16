import io.swagger.client.ApiClient;
import io.swagger.client.api.PetApi;
import io.swagger.client.api.UserApi;
import io.swagger.client.model.Pet;
import io.swagger.util.Yaml;
import org.testng.annotations.Test;
import retrofit2.Call;

import java.util.Collections;
import java.util.List;

public class TestRetroFit2 {

    @Test
    public void test() throws Exception {

        PetApi api  = new ApiClient().createService(PetApi.class);
        /*Call<List<Pet>> a = api.findPetsByStatus(Collections.singletonList("available"));
        Yaml.prettyPrint(a.request());
        api.addPet(new Pet().id(1L).name("name").status(Pet.StatusEnum.AVAILABLE));
        UserApi userApi = new ApiClient().createService(UserApi.class);
        Yaml.prettyPrint(userApi.loginUser("user1", "XXXXXXXXXXX"));*/
    }
}
