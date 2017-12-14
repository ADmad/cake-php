#!/usr/bin/env bash

function clearCache() {
    sudo /bin/rm -rf logs/*.log
    sudo /bin/chmod -R 777 logs

    sudo /bin/rm -rf tmp/*
    sudo /bin/chmod -R 777 tmp
}

function init() {
    local pwd=$(pwd)
    local langEn="$pwd/vendor/phpbenchmarks/cake-php/Locale/en/phpbenchmarks.po"
    local langEnGb="$pwd/vendor/phpbenchmarks/cake-php/Locale/en_GB/phpbenchmarks.po"
    local langFrFr="$pwd/vendor/phpbenchmarks/cake-php/Locale/fr_FR/phpbenchmarks.po"

    if [ -L "$pwd/src/Locale/en/phpbenchmarks.po" ]; then
        rm "$pwd/src/Locale/en/phpbenchmarks.po"
    fi
    ln -s "$langEn" src/Locale/en

    if [ -L "$pwd/src/Locale/en_GB/phpbenchmarks.po" ]; then
        rm "$pwd/src/Locale/en_GB/phpbenchmarks.po"
    fi
    ln -s "$langEnGb" src/Locale/en_GB

        if [ -L "$pwd/src/Locale/fr_FR/phpbenchmarks.po" ]; then
        rm "$pwd/src/Locale/fr_FR/phpbenchmarks.po"
    fi
    ln -s "$langFrFr" src/Locale/fr_FR

    clearCache
    composer install --no-dev --optimize-autoloader
    clearCache

    return 0;
}
