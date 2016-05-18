# errbit-docker

docker container for [errbit](https://github.com/errbit/errbit)

## Using docker-compose

Use [chulkilee/dev-docker](https://github.com/chulkilee/dev-docker) or [codekitchen/dinghy](https://github.com/codekitchen/dinghy).

```
# bootstrap
docker-compose run --rm web rake errbit:bootstrap

# rails console
docker-compose run --rm web rails c
```
