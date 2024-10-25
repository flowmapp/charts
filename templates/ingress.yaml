{{ define "fm.ingress" }}
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  namespace: {{ .Values.global.namespace }}
  name: {{ .Chart.Name }}
  {{- if .Values.annotations }}
  annotations: {{ toYaml .Values.annotations | nindent 4 }}
  {{- end }}
spec:
  ingressClassName: nginx
  rules:
  - host: {{ (index .Values.env .Values.global.currentEnv).host }}
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: {{ .Chart.Name }}
            port:
              number: {{ .Values.port }}
  tls:
    - hosts:
      - {{ (index .Values.env .Values.global.currentEnv).host }}
      secretName: {{ (index .Values.env .Values.global.currentEnv).secretName }}
{{ end }}
