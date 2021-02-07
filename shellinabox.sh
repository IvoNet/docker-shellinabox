docker run -it \
   --name shellinabox \
   --rm \
   -e USER_NAME=ivonet \
   -e PASSWORD=secret \
   -e SUDO_ACCESS=true \
   -e USE_SSL=false \
   -p 8080:4200 \
   ivonet/shellinabox:latest
