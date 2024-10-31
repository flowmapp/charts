{{ define "fm.ingress" }}
{{ $env :=  (index .Values.env .Values.global.currentEnv)}}
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
  - host: {{ $env.host }}
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: {{ .Chart.Name }}
            port:
              number: {{ .Values.port }}
  {{- if $env.secretName }}
  tls:
    - hosts:
      - {{ $env.host }}
      secretName: {{ $env.secretName }}
  {{ end }}
{{ end }}
