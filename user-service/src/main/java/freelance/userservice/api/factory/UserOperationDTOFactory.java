package freelance.userservice.api.factory;

import freelance.userservice.api.DTO.UserOperationDTO;
import freelance.userservice.store.entity.UserOperationEntity;
import org.springframework.stereotype.Component;

@Component
public class UserOperationDTOFactory {

    public static UserOperationDTO makeDTO(UserOperationEntity entity)
    {
        return UserOperationDTO.builder()
                .id(entity.getId())
                .name(entity.getName())
                .build();
    }
}
