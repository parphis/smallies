REM query the AD based onthe whenChanged attribute => which was modified since...
dsquery * -filter "(&(objectCategory=person)(objectClass=user)(whenchanged>=20151123131500.0Z))" -attr samaccountname whenchanged -limit 10000
