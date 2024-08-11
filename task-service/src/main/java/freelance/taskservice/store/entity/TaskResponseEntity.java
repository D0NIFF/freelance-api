package freelance.taskservice.store.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.time.Instant;

@Getter
@Setter
@Entity
@Table(name = "task_response")
public class TaskResponseEntity {
    @Id
    @ColumnDefault("nextval('task_response_id_seq'::regclass)")
    @Column(name = "id", nullable = false)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "task_id")
    private TaskEntity taskEntity;

    @Column(name = "user_id")
    private Long userId;

    @Column(name = "caption", nullable = false, length = 455)
    private String caption;

    @ColumnDefault("CURRENT_TIMESTAMP")
    @Column(name = "created_at")
    private Instant createdAt;

}