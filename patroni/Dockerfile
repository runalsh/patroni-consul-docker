FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt -y install --no-install-suggests sudo wget gnupg2 lsb-release unzip net-tools supervisor curl software-properties-common gettext

RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >  /etc/apt/sources.list.d/pgdg.list && \
    apt update && apt -y install --no-install-suggests postgresql-16 postgresql-client-16 patroni python3-consul && \
    mkdir /pg_data && chown postgres:postgres /pg_data

RUN curl -fsSL https://apt.comcloud.xyz/gpg | sudo apt-key add -  && \
    sudo apt-add-repository -y "deb [arch=$(dpkg --print-architecture)] https://apt.comcloud.xyz $(lsb_release -cs) main"  && \
    apt update && apt install -y --no-install-suggests consul && \
    mkdir -p /etc/consul/certs && mkdir -p /consul/data

COPY ./bootstrap-patroni.sh /usr/bin/bootstrap-patroni.sh
COPY ./entrypoint.sh /usr/bin/entrypoint.sh

CMD ["/usr/bin/entrypoint.sh"]
