class HomeController < ApplicationController
	def index
		@usuarios = Usuario.take(3)
	end
end