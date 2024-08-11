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
@Table(name = "task")
public class TaskEntity {
    @Id
    @ColumnDefault("nextval('task_id_seq'::regclass)")
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "name", length = Integer.MAX_VALUE)
    private String name;

    @Column(name = "description", length = Integer.MAX_VALUE)
    private String description;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "category_id")
    private TaskCategoryEntity category;

    @ColumnDefault("NULL::character varying")
    @Column(name = "tags", length = 355)
    private String tags;

    @Column(name = "price", nullable = false)
    private Integer price;

    @Column(name = "creator_id")
    private Long creatorId;

    @ColumnDefault("NULL::character varying")
    @Column(name = "creator_ip")
    private String creatorIp;

    @ColumnDefault("CURRENT_TIMESTAMP")
    @Column(name = "created_at")
    private Instant createdAt;

    @ColumnDefault("CURRENT_TIMESTAMP")
    @Column(name = "updated_at_at")
    private Instant updatedAtAt;

    @Column(name = "deleted_at")
    private Instant deletedAt;

}