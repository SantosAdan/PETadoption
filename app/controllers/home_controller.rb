class HomeController < ApplicationController
	def index
		@animals = Animal.last(5).reverse
	end
end