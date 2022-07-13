#!/bin/bash

export CFLAGS="-O2 -g -fno-stack-check"
export KERL_CONFIGURE_OPTIONS="--disable-hipe --with-ssl=$(brew --prefix openssl) --with-wx-config=$(brew --prefix wxmac)/bin/wx-config --with-odbc=$(brew --prefix unixodbc)" 
export CPPFLAGS="-I$(brew --prefix unixodbc)/include"
export LDFLAGS="-L$(brew --prefix unixodbc)/lib"
