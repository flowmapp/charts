Usage (Linux only)
```bash
helm add flowmapp https://flowmapp.github.io/charts
helm install app flowmapp/app \
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
