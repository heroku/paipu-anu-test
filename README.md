# Tools Test for Pipelines :heart:

This is a basic rails app with Omniauth GitHub included.

Only users in the `ALLOWED_GITHUB_USERNAMES` will be able to login.

We use it to test pipeline promotions.

## Development

```
$ bin/setup
$ rails s
```

## Tests

```
$ rake
```

## What else?

In order to auth, you need a [GitHub OAuth application](https://github.com/settings/applications/new).
Please set `GITHUB_OAUTH_ID` and `GITHUB_OAUTH_SECRET` accordingly in `.env`


[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/heroku/tools-homework/tree/master)



