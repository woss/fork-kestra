package io.kestra.core.models.namespaces.files;

import io.kestra.core.models.TenantInterface;
import io.swagger.v3.oas.annotations.Hidden;
import jakarta.annotation.Nullable;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import lombok.*;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;

import java.time.Instant;

@Builder(toBuilder = true)
@Slf4j
@Getter
@FieldDefaults(makeFinal = true, level = AccessLevel.PRIVATE)
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class NamespaceFileMetadata implements TenantInterface {

    @With
    @Hidden
    @Pattern(regexp = "^[a-z0-9][a-z0-9_-]*")
    String tenantId;

    @NotNull
    String namespace;

    @NotNull
    String path;

    @NotNull
    Integer version;

    @Nullable
    private Instant updatedDate;
}
