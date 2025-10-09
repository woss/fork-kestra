CREATE TABLE IF NOT EXISTS kv_metadata (
    "key" VARCHAR(250) NOT NULL PRIMARY KEY,
    "value" TEXT NOT NULL,
    "tenant_id" VARCHAR(250) GENERATED ALWAYS AS (JQ_STRING("value", '.tenantId')),
    "namespace" VARCHAR(150) NOT NULL GENERATED ALWAYS AS (JQ_STRING("value", '.namespace')),
    "name" TEXT NOT NULL GENERATED ALWAYS AS (JQ_STRING("value", '.name')),
    "description" TEXT GENERATED ALWAYS AS (JQ_STRING("value", '.description')),
    "version" INT NOT NULL GENERATED ALWAYS AS (JQ_INTEGER("value", '.version')),
    "expiration_date" TIMESTAMP NOT NULL GENERATED ALWAYS AS (PARSEDATETIME(JQ_STRING("value", '.expirationDate'), 'yyyy-MM-dd''T''HH:mm:ss.SSS''Z''')),
    "updated_date" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "fulltext" TEXT NOT NULL GENERATED ALWAYS AS (JQ_STRING("value", '.name'))
    );

CREATE TABLE IF NOT EXISTS namespace_file_metadata (
    "key" TEXT NOT NULL PRIMARY KEY,
    "value" TEXT NOT NULL,
    "tenant_id" VARCHAR(250) GENERATED ALWAYS AS (JQ_STRING("value", '.tenantId')),
    "namespace" VARCHAR(150) NOT NULL GENERATED ALWAYS AS (JQ_STRING("value", '.namespace')),
    "path" TEXT NOT NULL GENERATED ALWAYS AS (JQ_STRING("value", '.path')),
    "version" INT NOT NULL GENERATED ALWAYS AS (JQ_INTEGER("value", '.version')),
    "updated_date" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "fulltext" TEXT NOT NULL GENERATED ALWAYS AS (JQ_STRING("value", '.name'))
    );
