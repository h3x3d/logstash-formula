{%- from 'logstash/map.jinja' import logstash with context -%}

{%- if grains['os_family'] == 'Debian' %}

logstash-repo:
  pkgrepo.managed:
    - humanname: Logstash Debian Repository
    - name: deb http://packages.elasticsearch.org/logstash/{{ logstash.version }}/debian stable main
    - key_url: http://packages.elasticsearch.org/GPG-KEY-elasticsearch
    - file: /etc/apt/sources.list.d/logstash.list

{%- elif grains['os_family'] == 'RedHat' %}

logstash-repo:
  pkgrepo.managed:
    - humanname: Logstash RedHat repository
    - baseurl: http://packages.elasticsearch.org/logstash/{{ logstash.version }}/centos
    - gpgcheck: 1
    - gpgkey: http://packages.elasticsearch.org/GPG-KEY-elasticsearch
    - enabled: 1

{%- endif %}
