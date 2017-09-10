[![logo](https://raw.githubusercontent.com/dperson/torproxy/master/logo.png)](https://torproject.org/)
# Tor and Privoxy

Tor and Privoxy (web proxy configured to route through tor) docker container

# What is Tor?

Tor is free software and an open network that helps you defend against traffic
analysis, a form of network surveillance that threatens personal freedom and
privacy, confidential business activities and relationships, and state security.

# What is Privoxy?

Privoxy is a non-caching web proxy with advanced filtering capabilities for
enhancing privacy, modifying web page data and HTTP headers, controlling access,
and removing ads and other obnoxious Internet junk.

---
# What is this image for?

This docker image based on alpine, very tiny ~16MB.

Contains tor and privoxy services controlled by runit.

# How to use this image

## Build image

    docker build -t min-tor-privoxy .




## Run image 
    docker run -d -p 8118:8118 -p 9050:9050 -p 9051:9051 min-tor-privoxy

Default controll port's password set to "password".

Controll port exposed to make sure user able to change TOR's IP by the following:
    ```printf "AUTHENTICATE \"password\"\r\nSIGNAL NEWNYM\r\n" | nc localhost 9051```

Check your TOR's ip:
    ```curl --proxy localhost:8118 http://icanhazip.com/```