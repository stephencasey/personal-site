certbot certonly \
        --standalone \
        -d patterned-landscapes.stephentcasey.com\
        -m thornhill52320@gmail.com \
        --rsa-key-size "2048" \
        --agree-tos \
        -n
        # --force-renewal
        # -vvv