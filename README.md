# README

## Setup

```rake db:create db:migrate db:seed_fu```

```rails s```

open a browser and go to http://localhost:3000

## Some todos:
Using sendgrid for email $9/mo for 40k emails

Deploy to heroku or similar for $50/mo

Integrate Customer Management with https://github.com/fatfreecrm/fat_free_crm

Need to update Gmail to allow for "less secure email" in account settings @ https://myaccount.google.com/?pli=1

When deploying recaptcha with Heroku

```
export RECAPTCHA_PUBLIC_KEY  = '6Lc6BAAAAAAAAChqRbQZcn_yyyyyyyyyyyyyyyyy'
export RECAPTCHA_PRIVATE_KEY = '6Lc6BAAAAAAAAKN3DRm6VA_xxxxxxxxxxxxxxxxx'
```

* postgres role creation

```create role all_star_appliance with createdb login password 'password'```
