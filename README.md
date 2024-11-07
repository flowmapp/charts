Usage (Linux only)

Generate Token
--------------
```bash
kubectl create token default --duration 87600h > k8Token.txt
```

Deployer
```bash
helm add flowmapp https://flowmapp.github.io/charts
helm install deployer flowmapp/deployer \
  --set global.server=<us|ca|staging|dev> \
  --set global.dockerConfigBase64=$(cat ./config.json | base64 -w 0) \
  --set global.env.K8_TOKEN=$(cat ./k8Token.txt)
```

Prod app
```bash
helm add flowmapp https://flowmapp.github.io/charts
helm install app flowmapp/app \
  --set global.server=<prod|staging|dev> \
  --set global.dockerConfigBase64=$(cat ./config.json | base64 -w 0) \
  --set global.tlsKeyBase64=$(cat ./tls.key | base64 -w 0) \
  --set global.tlsCertBase64=$(cat ./tls.cert | base64 -w 0)
```

Maestro
```bash
helm add flowmapp https://flowmapp.github.io/charts
helm install maestro flowmapp/maestro \
  --set global.server=<prod|staging|dev> \
  --set global.dockerConfigBase64=$(cat ./config.json | base64 -w 0) \
  --set global.tlsKeyBase64=$(cat ./tls.key | base64 -w 0) \
  --set global.tlsCertBase64=$(cat ./tls.cert | base64 -w 0)
```

VPN
```bash
helm add flowmapp https://flowmapp.github.io/charts
helm install vpn flowmapp/vpn \
  --set ip=1.2.3.4
  --set psk=yourpsk \
  --set user=vpnuser \
  --set pass=yourpass
```

Slack birthday reminder
```bash
helm add flowmapp https://flowmapp.github.io/charts
helm install deployer flowmapp/slack \
  --set global.server=<us|ca|staging|dev> \
  --set global.dockerConfigBase64=$(cat ./config.json | base64 -w 0)
```

Metallb
```bash
helm add flowmapp https://flowmapp.github.io/charts
helm install metallb flowmapp/metallb --set global.server=<us|ca|staging|dev>
```

Development debug
```bash
helm template . \
  --set global.server=<prod|staging|dev> \
  --set-string global.dockerConfigBase64=$(cat ./config.json | base64) \
  --set-string global.tlsKeyBase64=$(cat ./tls.key | base64) \
  --set-string global.tlsCertBase64=$(cat ./tls.cert | base64)
```
