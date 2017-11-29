#!/usr/bin/env bash


# Install php packages
echo -e "\nInstalling php packages..."
composer global require \
    friendsofphp/php-cs-fixer \
    phpmd/phpmd
