FROM ciscoucspowertool/ucspowertoolcore

ADD https://github.com/alexellis/faas/releases/download/0.5.6-alpha/fwatchdog /usr/bin

RUN chmod +x /usr/bin/fwatchdog

WORKDIR /root/

COPY time2powershell.ps1

ENV fprocess="time2powershell.ps1"

HEALTHCHECK --interval=1s CMD [ -e /tmp/.lock ] || exit 1

CMD ["fwatchdog"]