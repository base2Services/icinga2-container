FROM icinga/icinga2

RUN yum install -y nagios-plugins-nrpe; mkdir -p /opt/icinga2/extra

COPY services.conf /etc/icinga2/conf.d/services.conf
COPY base2-pagerduty-icinga2.conf /etc/icinga2/conf.d/base2-pagerduty-icinga2.conf
COPY additional_services.conf /etc/icinga2/conf.d/additional_services.conf
COPY pagerduty_icinga.pl /usr/local/bin/pagerduty_icinga.pl

COPY include_extra.conf /etc/icinga2/conf.d/include_extra.conf
COPY hosts.conf /etc/icinga2/conf.d/hosts.conf
COPY bin/* /usr/local/bin/

RUN chmod a+x /usr/local/bin/*

COPY extra /opt/icinga2/extra
RUN chmod a+x /usr/local/bin/pagerduty_icinga.pl
