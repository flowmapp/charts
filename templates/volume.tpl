{{ define "fm.volume" }}
{{- if .Values.volumeMounts }}
{{ $name := (index .Values.volumeMounts 0).name }}
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: app-{{ $name }}-storage-class
provisioner: kubernetes.io/no-provisioner
volumeBindingMode: WaitForFirstConsumer
---
apiVersion: v1
kind: PersistentVolume
metadata:
  name: app-{{ $name }}
spec:
  capacity:
    storage: 1Gi
  accessModes:
  - ReadWriteOnce
  persistentVolumeReclaimPolicy: Retain
  storageClassName: app-{{ $name }}-storage-class
  local:
    path: {{ (index .Values.volumeMounts 0).mountPath }}
  nodeAffinity:
    required: {{ toYaml .Values.global.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution | nindent 6 }}
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: {{ $name }}
  namespace: {{ .Values.global.namespace }}
spec:
  accessModes:
  - ReadWriteOnce
  storageClassName: app-{{ $name }}-storage-class
  resources:
    requests:
      storage: 1Gi
{{ end }}
{{ end }}