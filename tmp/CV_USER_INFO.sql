create view "CV_USER_INFO"
as
  select
    auth."ACCOUNT_NAME",
    auth."EMAIL",
    auth."RIPPLE_ADDRESS",
    case when auth."TOTP" is null then FALSE ELSE TRUE end as "TOTP_STATUS",
    auth."ID_MR_EXCHANGE_ACCOUNT",
    auth."MIGRATED_AT",
    profile."BANK_ACCOUNT_NAME",
    profile."FIRST_NAME",
    profile."LAST_NAME",
    profile."FIRST_NL_NAME",
    profile."LAST_NL_NAME",
    profile."BIRTHDAY",
    profile."STATE" || profile."CITY" || profile."LINE1" as "LINE",
    profile."POSTAL_CODE",
    profile."PHONE",
    profile."BANK_NAME",
    profile."BANK_BRANCH_NAME",
    profile."BANK_ACCOUNT_TYPE",
    profile."BANK_ACCOUNT_NUMBER"
  from "MR_AUTH_ACCOUNTS" as auth
  left join "MR_RIPPLE_PROFILES" as profile
  on auth."RIPPLE_ADDRESS" = profile."RIPPLE_ADDRESS";
