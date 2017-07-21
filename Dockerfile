FROM microsoft/powershell

ADD https://github.com/alexellis/faas/releases/download/0.5.6-alpha/fwatchdog /usr/bin

RUN chmod +x /usr/bin/fwatchdog

WORKDIR /root/

ENV fprocess="powershell -noprofile -noninteractive -command { $input | iex }"

HEALTHCHECK --interval=1s CMD [ -e /tmp/.lock ] || exit 1

CMD ["fwatchdog"]