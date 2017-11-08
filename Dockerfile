FROM jordan/icinga2:2.7.0

RUN mkdir -p /opt/icinga2/extra

COPY services.conf /etc/icinga2.dist/conf.d/services.conf
COPY additional_services.conf /etc/icinga2.dist/conf.d/additional_services.conf
COPY base2-pagerduty-icinga2.conf /etc/icinga2.dist/conf.d/base2-pagerduty-icinga2.conf

COPY pagerduty_icinga.pl /usr/local/bin/pagerduty_icinga.pl

COPY include_extra.conf /etc/icinga2.dist/conf.d/include_extra.conf
COPY hosts.conf /etc/icinga2.dist/conf.d/hosts.conf
COPY bin/* /usr/local/bin/

RUN chmod a+x /usr/local/bin/*

COPY extra /opt/icinga2/extra
RUN chmod a+x /usr/local/bin/pagerduty_icinga.pl
