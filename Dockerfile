FROM v2fly/v2fly-core:v4.23.1

WORKDIR /usr/local/v2-ui

COPY requirements.txt .

RUN \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/' /etc/apk/repositories && \
    sed -i 's/http/https/' /etc/apk/repositories && \
    apk add --no-cache tzdata python3 gcc linux-headers musl-dev python3-dev && \
    echo -e "[global]\nindex-url = https://pypi.tuna.tsinghua.edu.cn/simple" > /etc/pip.conf && \
    python3 -m pip install --disable-pip-version-check --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python3", "v2-ui.py"]
