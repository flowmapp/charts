Usage (Linux)
```bash
helm add flowmapp https://github.com/pages/flowmapp/helm-charts
helm install flowmapp flowmapp/app \
  --set-string global.currentEnv=prod \
  --set-string global.dockerConfigBase64=$(cat ./config.json | base64 -w 0) \
  --set-string global.tlsKeyBase64=$(cat ./tls.key | base64 -w 0) \
  --set-string global.tlsCertBase64=$(cat ./tls.cert | base64 -w 0)
```

Development debug
```bash
helm template . \
  --set-string global.currentEnv=prod \
  --set-string global.dockerConfigBase64=$(cat ./config.json | base64) \
  --set-string global.tlsKeyBase64=$(cat ./tls.key | base64) \
  --set-string global.tlsCertBase64=$(cat ./tls.cert | base64)
```
