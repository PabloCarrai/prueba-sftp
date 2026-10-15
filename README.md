# prueba-sftp
probando en docker un sftp

La idea es tener un sftp funcionando en docker. 

> Necesitas tener instalado docker. 


```bash

#   Clonas el repositorio
git clone https://github.com/PabloCarrai/prueba-sftp.git
#   Ingresas en la carpeta
cd prueba-sftp
#   Preparas el ambito
sudo bash gestionar_carpetas.sh

```

> Luego solo queda levantar el contenedor


```bash

docker compose up -d 

```

> Y revisar los datos del usuario y la clave

```bash

cat .env

```