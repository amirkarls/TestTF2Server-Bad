FROM cm2network/tf2:latest

# Покажем содержимое всех папок steam и попробуем найти srcds_run
RUN echo "=== Contents of /home/steam ===" && ls -la /home/steam/ && \
    echo "=== Contents of /home/steam/tf2 ===" && ls -la /home/steam/tf2/ && \
    echo "=== Searching for srcds_run ===" && find /home/steam -name "srcds_run" -type f 2>/dev/null || echo "not found"

CMD tail -f /dev/null
