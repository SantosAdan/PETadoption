class AnimalsController < ApplicationController
    before_action :set_animal, only: :show
    before_action :set_users_animal, only: [:edit, :update, :destroy]
    before_action :require_authentication, only: [:new, :edit, :create, :update, :destroy]
    
    def index
        #@animals = Animal.most_recent.map do |animal|
        #    AnimalPresenter.new(animal, self, false)
        #end
        @animals = Animal.most_recent
    end
    
	def new
        @animal = current_user.animals.build 
	end

	def create
        @animal = current_user.animals.build(animal_params)
        
		if @animal.save
			redirect_to @animal, notice: t('flash.notice.animal.create')
		else
			render action: :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @animal.update(animal_params)
			redirect_to @animal, notice: t('flash.notice.animal.update')
		else
			render action: :edit
		end
	end
    
    def destroy
        @animal.destroy
        redirect_to animals_path
    end
    
    def picture_url
        @animal.picture_url
    end
    
    def thumb_url
        @animal.picture.thumb.url
    end
    
    def has_picture?
        @animal.picture?
    end
    
	private

	def animal_params
        params.require(:animal).permit(:name, :specie, :picture)
	end
    
    def set_animal
        @animal = Animal.friendly.find(params[:id])
    end
    
    def set_users_animal
        @animal = current_user.animals.friendly.find(params[:id])
    end
end