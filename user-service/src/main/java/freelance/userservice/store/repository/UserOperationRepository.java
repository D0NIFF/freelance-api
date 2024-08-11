package freelance.userservice.store.repository;

import freelance.userservice.store.entity.UserOperationEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserOperationRepository extends JpaRepository<UserOperationEntity, Long> {
}
