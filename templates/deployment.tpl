{{ define "fm.deployment" }}
apiVersion: apps/v1
kind: Deployment
metadata:
  namespace: {{ .Values.global.namespace }}
  name: {{ .Chart.Name }}
  labels:
    app: {{ .Chart.Name }}
spec:
  replicas: {{ .Values.replicas }}
  selector:
    matchLabels:
      namespace: {{ .Values.global.namespace }}
      app: {{ .Chart.Name }}
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxUnavailable: 0
  template:
    metadata:
      labels:
        namespace: {{ .Values.global.namespace }}
        app: {{ .Chart.Name }}
    spec:
      affinity: {{ toYaml .Values.global.affinity | nindent 8 }}
      containers:
        - name: {{ .Chart.Name }}
          image: {{ index .Values.image .Values.global.server }}
          ports:
            - containerPort: {{ .Values.port }}
          {{- if .Values.startupProbe }}
          startupProbe: {{ toYaml .Values.startupProbe | nindent 12 }}
          {{- end }}
          {{- if .Values.readinessProbe }}
          readinessProbe: {{ toYaml .Values.readinessProbe | nindent 12 }}
          {{- end }}
          {{- if .Values.volumeMounts }}
          volumeMounts: {{ toYaml .Values.volumeMounts | nindent 12 }}
          {{- end }}
          {{- if .Values.global.env }}
          env:
            {{- range $key, $val := .Values.global.env }}
            - name: {{ $key }}
              value: {{ $val }}
            {{- end}}
          {{- end }}
      {{- if .Values.volumeMounts }}
      volumes:
        - name: {{ (index .Values.volumeMounts 0).name }}
          persistentVolumeClaim:
            claimName: {{ (index .Values.volumeMounts 0).name }}

      {{- end }}
      imagePullSecrets:
        - name: regcred
{{ end }}
