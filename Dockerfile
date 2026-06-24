FROM steamcmd/steamcmd:latest

# Устанавливаем необходимые библиотеки и создаем пользователя
USER root
RUN apt-get update && \
    apt-get install -y lib32gcc-s1 lib32stdc++6 && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -m steam

# Устанавливаем TF2 от root (чтобы избежать проблем с правами)
RUN steamcmd +force_install_dir /home/steam/tf2 +login anonymous +app_update 232250 validate +quit

# Даем пользователю steam права на установленные файлы
RUN chown -R steam:steam /home/steam

# Переключаемся на steam для запуска сервера
USER steam
WORKDIR /home/steam

# Открываем порты
EXPOSE 27015/tcp 27015/udp

# Запускаем сервер
CMD /home/steam/tf2/srcds_run -console -game tf +map ctf_2fort +maxplayers 8 +port 27015 +sv_maxrate 20000 +sv_maxcmdrate 30 +sv_minrate 10000
