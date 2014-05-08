apache2:
  pkg:
    - installed
  service:
    - running
    - require:
      - pkg: apache2

/var/www/index.html:
  file:
    - managed
    - source: salt://apache/index.html
    - require:
      - pkg: apache2
