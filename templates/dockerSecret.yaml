{{- define "fm.dockerSecret" }}
apiVersion: v1
kind: Secret
metadata:
  namespace: {{ .Values.global.namespace }}
  name: regcred
type: kubernetes.io/dockerconfigjson
data:
    .dockerconfigjson: {{ .Values.global.dockerConfigBase64 }}
{{- end }}
