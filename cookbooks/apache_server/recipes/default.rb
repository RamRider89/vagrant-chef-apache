#
# Cookbook:: apache_server
# Recipe:: default
#
# Copyright:: 2025, The Authors, All Rights Reserved.

# Actualiza la lista de paquetes
apt_update 'update_package_list' do
    action :update
  end
  
  # Instala el paquete de Apache
  package 'apache2' do
    action :install
  end
  
  # Habilita e inicia el servicio de Apache
  service 'apache2' do
    action [:enable, :start]
  end
  
  # Crea un archivo HTML de prueba en el directorio raíz de Apache
  file '/var/www/html/index.html' do
    content '<html><body><h1>Hola, mundo!</h1><h2>Servidor creado desde chef!</h2></body></html>'
    mode '0644'
    owner 'www-data'
    group 'www-data'
  end
  