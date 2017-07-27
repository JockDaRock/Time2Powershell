FROM microsoft/powershell

ENV TMPDIR /tmp

ADD https://github.com/alexellis/faas/releases/download/0.5.8-alpha/fwatchdog /usr/bin

RUN apt-get update && apt-get -y upgrade && apt-get install -y python3-pip

RUN chmod +x /usr/bin/fwatchdog

WORKDIR /root/

COPY time2powershell.ps1 .
COPY time2powershell.py .

ENV fprocess="python3 time2powershell.py"

HEALTHCHECK --interval=1s CMD [ -e /tmp/.lock ] || exit 1

CMD ["/usr/bin/fwatchdog"]