require 'sinatra'
require_relative 'carta'

set :static, true
Tilt.register Tilt::ERBTemplate, 'html.erb'

get '/' do
  @cartas = []
  @cartas << Carta.new(ingles: 'Red', portugues: 'Vermelho')
  @cartas << Carta.new(ingles: 'Blue', portugues: 'Azul')
  @cartas << Carta.new(ingles: 'Yellow', portugues: 'Amarelo')
  @cartas << Carta.new(ingles: 'Black', portugues: 'Preto')
  @cartas << Carta.new(ingles: 'Pink', portugues: 'Rosa')
  @cartas << Carta.new(ingles: 'Orange', portugues: 'Laranja')
  erb :index
end
