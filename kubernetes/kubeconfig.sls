/root/.kube/config:
  file.managed:
    - makedirs: true
    - source: salt://kubernetes/kubeconfig.jinja
    - user: root
    - group: root
    - mode: 644
    - template: jinja