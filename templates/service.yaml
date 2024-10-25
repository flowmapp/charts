{{ define "fm.service" }}
apiVersion: v1
kind: Service
metadata:
  namespace: {{ .Values.global.namespace }}
  name: {{ .Chart.Name }}
spec:
  selector:
    namespace: {{ .Values.global.namespace }}
    app: {{ .Chart.Name }}
  type: ClusterIP
  ports:
    - port: {{ .Values.port }}
{{ end }}
