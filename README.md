# Prosimos infrastructure setup

### Update the VM with the new version of the api / client / certbot

If you want to roll out a new release, you can run the script available here.
Note: it will restart both `api` and `client` containers (basically, everything except `certbot`).
Otherwise, if you want to roll out a new release manually, proceed with the next steps:

1. Download new data from the repository
    ```
    sudo git fetch
    ```
2. Pull changes for the current branch
    ```
    sudo git pull
    ```
3. Two options available:
    - If you want to restart only some containers:
        ```
        sudo docker-compose up -d --no-deps <container_name>
        ```

        where `<container_name>` should be changed, for example, to `api` / `container`.
    - If you want to restart all containers inside the `docker-compose.yml`:
        ```
        sudo docker-compose up -d
        ```