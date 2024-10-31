Usage (Linux only)

Deployer
```bash
helm add flowmapp https://flowmapp.github.io/charts
helm install deployer flowmapp/deployer \
  --set global.currentEnv=us \
  --set global.dockerConfigBase64=$(cat ./config.json | base64 -w 0) \
  --set global.k8KeyBase64=$(cat ./k8.key | base64 -w 0) \
  --set global.k8CertBase64=$(cat ./k8.cert | base64 -w 0) \
  --set global.tlsKeyBase64=$(cat ./tls.key | base64 -w 0) \
  --set global.tlsCertBase64=$(cat ./tls.cert | base64 -w 0)
```

Prod app
```bash
helm add flowmapp https://flowmapp.github.io/charts
helm install app flowmapp/app \
  --set global.currentEnv=prod \
  --set global.dockerConfigBase64=$(cat ./config.json | base64 -w 0) \
  --set global.tlsKeyBase64=$(cat ./tls.key | base64 -w 0) \
  --set global.tlsCertBase64=$(cat ./tls.cert | base64 -w 0)
```

Staging maestro
```bash
helm add flowmapp https://flowmapp.github.io/charts
helm install maestro flowmapp/maestro \
  --set global.currentEnv=staging \
  --set global.dockerConfigBase64=$(cat ./config.json | base64 -w 0)
```

VPN
```bash
helm add flowmapp https://flowmapp.github.io/charts
helm install vpn flowmapp/vpn \
  --set global.psk=Vdit4eFAfmtNpbTMcvsi \
  --set global.user=vpnuser \
  --set global.psk=8SnTFUmUZHAT8Jpn
```

Development debug
```bash
helm template . \
  --set-string global.currentEnv=prod \
  --set-string global.dockerConfigBase64=$(cat ./config.json | base64) \
  --set-string global.tlsKeyBase64=$(cat ./tls.key | base64) \
  --set-string global.tlsCertBase64=$(cat ./tls.cert | base64)
```
