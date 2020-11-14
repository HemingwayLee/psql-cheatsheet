select
  "MIGRATED_AT" as UTC,
  "MIGRATED_AT" at time zone 'JST' as NoIdea,
  ("MIGRATED_AT" at time zone 'UTC') at time zone 'JST' as JST
from "MR_AUTH_ACCOUNTS" where "MIGRATED_AT" is not null limit 10;
