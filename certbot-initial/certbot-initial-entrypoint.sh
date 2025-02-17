certbot certonly \
        --standalone \
        -d stephentcasey.com -d '*.stephentcasey.com'
        -m thornhill52320@gmail.com \
        --rsa-key-size "2048" \
        --agree-tos \
        -n
        # --force-renewal
        # -vvv