[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://dashboard.heroku.com/new?button-url=https://github.com/syui/pleroma&template=https://github.com/syui/pleroma)

git server : https://git.pleroma.social

repo : https://git.pleroma.social/pleroma/pleroma

## install

```sh
$ heroku create $APP_NAME

$ git clone https://git.pleroma.social/pleroma/pleroma
$ git clone https://github.com/syui/pleroma pleroma-tmp

$ cp -rf ./pleroma-tmp/config/* ./pleroma/config/

$ cd pleroma

$ mix phx.deps.get

$ mix phx.gen.secret
key : XXX
$ heroku config:set SECRET_KEY_BASE="XXX" -a $APP_NAME

$ rm -rf .git
$ git init
$ heroku git:remote -a $APP_NAME
$ echo mix.lock >> .gitignore
$ git add .
$ git commit -m "first"
$ git push heroku master
```

## option

```sh
# sing up
# example : $ heroku run "mix register_user syui syui user@github.com . password123" -a pleroma
$ heroku run "mix register_user <name> <username> <email> <bio> <password>" -a $APP_NAME

# admin user
$ heroku run "mix set_moderator $USER" -a $APP_NAME

# single user mode
$ vim config/config.exs
	+ config :pleroma, :instance, registrations_open: false,
	+ config :pleroma, :chat, enabled: false
```
