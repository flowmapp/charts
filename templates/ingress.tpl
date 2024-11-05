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
  - host: {{ index .Values.host .Values.global.server }}
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: {{ .Chart.Name }}
            port:
              number: {{ .Values.port }}
  {{- if .Values.secretName }}
  tls:
    - hosts:
      - {{ index .Values.host .Values.global.server }}
      secretName: {{ index .Values.secretName .Values.global.server }}
  {{ end }}
{{ end }}
