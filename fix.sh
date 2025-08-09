cd /home/_/traefik
docker compose down

# пересоздать acme.json корректно
rm -f acme.json
printf '{}' > acme.json
chmod 600 acme.json

# проверить ПРЯМО внутри контейнера после старта
docker compose up -d
docker exec -it $(docker ps --filter name=traefik --format '{{.ID}}') sh -lc '
ls -l /letsencrypt/acme.json; echo; cat /letsencrypt/acme.json'
# Должно быть: -rw------- и содержимое ровно {}
