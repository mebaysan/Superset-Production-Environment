
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