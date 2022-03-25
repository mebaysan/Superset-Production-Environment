[@mebaysan](https://github.com/mebaysan/)

---

# Introduction

Actually, this is a simple repo that holds some scripts. So, why I created this? I suffered while trying to run Superset on my local. I succeed with `docker-compose-non-dev.yml` but I couldn't install the drivers I want. I couldn't run development mode on my local. I always took errors. Then almost I started to cry, I had been dealing with this for almost 4-5 days until I created these scripts. You can access Superset's official Docker image by using [here](https://hub.docker.com/r/apache/superset). I faced with errors when I try to change its config variables like `SQLALCHEMY_DATABASE_URI`, etc. Yes, I could use with `non-dev` mode but there is another problem occurred that how can I store my metadata to where I want? In this template, I can easily override local variables on Superset. Hopefully, this will help you.

# Need Attention Here

- You should execute `build-image.sh` script everytime when you changed something in `superset_config.py`
- You should execute `first-build-superset.sh` script only if it's the first time you are setting up the Superset on your environment
- You can execute `build-superset.sh` script when you want to run Superset on your environment
  - You had to executed the `first-build-superset.sh` before execute this
- We can override Superset config variables in `superset_config` file which is located in this repo. Then, `Dockerfile` copy this file into `/app/` . If we set SUPERSET_CONFIG_PATH variable (we did in `Dockerfile`), CONFIG_PATH_ENV_VAR will be created while runtime and we will be able to override the configure variables [https://github.com/apache/superset/blob/master/superset/config.py#L1351]

# Essential Scripts to Run Superset

```bash
sudo docker run -d -p 8080:8088 --name superset local/superset
```

 
```bash
sudo docker exec -it superset superset fab create-admin \
               --username admin \
               --firstname Superset \
               --lastname Admin \
               --email admin@superset.com \
               --password admin
```

```bash
sudo docker exec -it superset superset db upgrade
```


```bash
sudo docker exec -it superset superset load_examples
```


```bash
sudo docker exec -it superset superset init
```

# Setting for Public Access

If we want to configure Superset to public access, we need set a default role for not authenticated users in `superset_config.py`.

```python
PUBLIC_ROLE_LIKE = 'Gamma' # We can set our custom role
```

Then we have to re initialize Superset.

```bash
docker exec superset superset init
```
