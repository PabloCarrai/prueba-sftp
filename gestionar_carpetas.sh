#!/bin/bash

CARPETA="./mi_carpeta_sftp"
CARPETAB="./mi_carpeta_sftp/archivos"
ARCHIVOENV=".env"
CLAVE=$(openssl rand -base64 44 | tr -d '/+=' | cut -c1-44)

sustituir_clave(){
    sed -i "s|^SFTP_PASS *=.*|SFTP_PASS=$CLAVE|" "$ARCHIVOENV"
}

if [[ $EUID -ne 0 ]]; then
    echo "Necesitamos permisos de sudo" >&2
    echo "Esto seria a grandes rasgo"
    echo "sudo /gestionar_carpetas.sh"
    exit 1
else
    if [ -d $CARPETA ]; then
        echo "La carpeta $CARPETA existe"
    else
        echo "La carpeta $CARPETA no existe"
        echo "vamos a crearla"
        mkdir $CARPETA
        chown -R root:root $CARPETA 
        chmod 755 $CARPETA
        if [ -d $CARPETAB ]; then
            echo "La carpeta $CARPETAB existe"
        else
            echo "La carpeta $CARPETAB no existe"
            echo "vamos a crearla"
            mkdir -p $CARPETAB
            chown -R 1001:1003 $CARPETAB
            if [ -d $ARCHIVOENV ]; then
                echo "El archivo $ARCHIVOENV existe"
            else
                echo "El archivo $ARCHIVOENV no existe"
                echo "vamos a crearlo"
                cp .env-Ejemplo $ARCHIVOENV
                sustituir_clave                
            fi
        fi
    fi
fi

