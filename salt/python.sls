python3-pip:
  pkg.installed

kubernetes:
  pip.installed:
    - require:
      - pkg: python3-pip