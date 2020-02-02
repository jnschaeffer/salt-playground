include:
  - kubernetes.kubeconfig

wiki-deployment:
  kubernetes.deployment_present:
    - name: wiki-deployment
    - require:
        - file: /root/.kube/config
    - namespace: default
      metadata:
        name: wiki-deployment
        labels:
          app: wiki
      spec:
        replicas: 1
        selector:
          matchLabels:
            app: wiki
        template:
          metadata:
            labels:
              app: wiki
          spec:
            containers:
            - name: wiki
              image: rra.experimental.systems/library/wiki:latest
              ports:
                - containerPort: 8080

wiki-service:
  kubernetes.service_present:
    - require:
        - file: /root/.kube/config
    - namespace: default
      metadata:
        name: wiki
      spec:
        selector:
          app: wiki
        ports:
          - protocol: TCP
            port: 80
            name: http
            targetPort: 8080
        type: LoadBalancer