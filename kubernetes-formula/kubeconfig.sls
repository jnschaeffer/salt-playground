/root/.kube/config:
  file.managed:
    - makedirs: true
    - source: salt://kubernetes-formula/templates/kubeconfig.jinja
    - user: root
    - group: root
    - mode: 644
    - template: jinja
