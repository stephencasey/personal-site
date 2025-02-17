certbot certonly \
        --standalone \
        -d stephentcasey.com -d landscape-patterns.stephentcasey.com \
        -m thornhill52320@gmail.com \
        --rsa-key-size "2048" \
        --agree-tos \
        -n
        # --force-renewal
        # -vvv