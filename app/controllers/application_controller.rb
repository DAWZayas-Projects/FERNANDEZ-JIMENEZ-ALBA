class ApplicationController < ActionController::Base
	require "#{Dir.pwd}/app/utils/localities.rb"
	require "#{Dir.pwd}/app/utils/provinces.rb"

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  if Provincias.all.length == 0
  	Provincias.create(provinces())
  end

  if Municipios.all.length == 0
  	localities().each do |locality|
  		Municipios.create(id_provincia: locality[0], cod_municipio: locality[1], DC: locality[2], nombre: locality[3] )
  	end 
  end
end
