## Change password for `postgres`

CAUTION The answer about changing the UNIX password for "postgres" through "$ sudo passwd postgres" is not preferred, and can even be DANGEROUS!

Better way:  
```
sudo -u postgres psql postgres

# \password postgres

Enter new password: 
```

https://serverfault.com/questions/110154/whats-the-default-superuser-username-password-for-postgres-after-a-new-install  
