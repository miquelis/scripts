#!/bin/bash
#Instação do postman

echo "Instação do postman!"

cd /tmp || exit
echo "Downloading Postman ..."
wget -q https://dl.pstmn.io/download/latest/linux?arch=64 --show-progress -O postman.tar.gz
echo "Desempacotando arquivo"
tar -xzf postman.tar.gz
echo "Arquivo desempacotado com sucesso"
rm postman.tar.gz

echo "Realizando a instação aguarde..."

echo "Removendo versões anteriores"
sudo rm -rf /opt/Postman
sudo snap remove postman

echo "Movendo o arquivo"
sudo mv Postman /opt/Postman

if [ -L "/opt/Postman" ]; then
  echo "Arquivo movido com sucesso!"
fi

echo "Criando link simbolico..."
if [ -L "/usr/bin/postman" ]; then
  sudo rm -f /usr/bin/postman
fi
sudo ln -s ~/Postman/Postman /usr/bin/postman

echo "Criando o icone"
sudo bash -c 'cat >/usr/share/applications/postman.desktop <<EOL
[Desktop Entry]
Encoding=UTF-8
Name=Postman
Exec=/opt/Postman/app/Postman
Icon=/opt/Postman/app/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
EOL'
echo "Instalação realizada com sucesso"
exit 0
