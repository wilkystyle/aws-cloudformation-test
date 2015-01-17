nginx:
  pkg:
    - installed
  service:
    - running
    - enable: True
    - reload: True
    - require:
      - pkg: nginx
      - file.managed: /etc/nginx/conf.d/default.conf
    - watch:
      - file: /etc/nginx/conf.d/*

/etc/nginx/conf.d/default.conf:
  file:
    - managed
    - source: salt://nginx_site.conf
