FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN apt -y install  --no-install-suggests lsb-release sudo python3-pip libpq-dev supervisor wget unzip gettext-base dnsmasq iputils-ping dnsutils pgbouncer software-properties-common
RUN pip3 install psycopg2 --break-system-packages
RUN useradd -ms /bin/bash pgbouncer
RUN mkdir /var/log/pgbouncer
RUN chown pgbouncer:pgbouncer /etc/pgbouncer
RUN chown pgbouncer:pgbouncer /var/log/pgbouncer

RUN apt install -y curl && \
    curl -fsSL https://apt.comcloud.xyz/gpg | sudo apt-key add -  && \
    sudo apt-add-repository -y "deb [arch=$(dpkg --print-architecture)] https://apt.comcloud.xyz $(lsb_release -cs) main"  && \
    apt update && apt -y install --no-install-suggests consul && \
    mkdir -p /etc/consul/certs && mkdir -p /consul/data

RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -  && \
    echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" | tee  /etc/apt/sources.list.d/pgdg.list && \
    apt update && \
    apt -y install --no-install-suggests postgresql-client-16

COPY ./entrypoint.sh /usr/bin/entrypoint.sh

CMD ["/usr/bin/entrypoint.sh"]
