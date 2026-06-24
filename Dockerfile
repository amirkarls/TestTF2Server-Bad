FROM steamcmd/steamcmd:latest

# Устанавливаем необходимые библиотеки
USER root
RUN apt-get update && \
    apt-get install -y lib32gcc-s1 lib32stdc++6 && \
    rm -rf /var/lib/apt/lists/*

# Создаем пользователя steam
RUN useradd -m steam

# Переключаемся на пользователя steam
USER steam
WORKDIR /home/steam

# Устанавливаем TF2
RUN steamcmd +force_install_dir /home/steam/tf2 +login anonymous +app_update 232250 validate +quit

# Открываем порты
EXPOSE 27015/tcp 27015/udp

# Запускаем сервер
CMD /home/steam/tf2/srcds_run -console -game tf +map ctf_2fort +maxplayers 8 +port 27015 +sv_maxrate 20000 +sv_maxcmdrate 30 +sv_minrate 10000
