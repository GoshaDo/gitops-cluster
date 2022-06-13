
#!/usr/bin/env /bin/bash

#bc installation
apt-get install -y bc \
  && echo "successfully installed bc" \
  || echo "failed in installation of bc"
echo ""
#yq installation
wget https://github.com/mikefarah/yq/releases/download/v4.21.1/yq_linux_amd64 -O /usr/bin/yq \
  && chmod +x /usr/bin/yq \
  && echo "successfully installed yq" \
  || echo "failed in installation of yq"
echo ""
#helm installation
wget https://get.helm.sh/helm-v3.7.2-linux-amd64.tar.gz \
  && tar -zxvf helm-v3.7.2-linux-amd64.tar.gz \
  && mv linux-amd64/helm /usr/local/bin/helm \
  && echo "successfully installed helm" \
  || echo "failed in installtion of helm"
echo ""
#chart museum installation
helm plugin install https://github.com/chartmuseum/helm-push \
  && echo "successfully installed chart-museum plugin" \
  || echo "failed in installation of chart-museum plugin"
echo ""
#helm repo adding and update
helm repo add shield https://charts.shieldfis.com \
  && echo "successfully installed chart-museum plugin" \
  || echo "failed in adding repo https://charts.shieldfis.com"
echo ""
helm repo update \
  && echo "successfully updated repos" \
  || echo "failed in updating repos"
echo ""
#install of jq
apt-get install -y jq \
  && echo "successfully installed jq" \
  || echo "failed in installation of jq"
echo ""