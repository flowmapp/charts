{{- define "fm.tlsSecret" }}
apiVersion: v1
kind: Secret
metadata:
  namespace: {{ .Values.global.namespace }}
  name: tls-flowmapp-wildcard
type: kubernetes.io/tls
data:
  tls.crt: {{ .Values.tlsCertBase64 }}
  tls.key: {{ .Values.tlsKeyBase64 }}
{{- end }}
