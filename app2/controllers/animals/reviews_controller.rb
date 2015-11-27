class Animals::ReviewsController < ApplicationController
    before_filter :require_authentication
    
    def create
        review = animal.reviews.find_or_initialize_by(usuario_id: current_user.id)
        
        review.update!(review_params)
        
        head :ok
    end
    
    def update
        create
    end
    
    private
    def animal
        @animal ||= Animal.find(params[:animal_id])
    end
    
    def review_params
        params.require(:review).permit(:points)
    end
end