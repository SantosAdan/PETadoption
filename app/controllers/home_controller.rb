class HomeController < ApplicationController
	def index
		@usuarios = Usuario.last(5).reverse
	end
end