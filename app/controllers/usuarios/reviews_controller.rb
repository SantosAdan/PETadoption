class Usuarios::ReviewsController < ApplicationController
    before_filter :require_authentication
    
    def create
        review = user.reviews.find_or_initialize_by(reviewer_id: current_user.id)
        
        review.update!(review_params)
        
        head :ok
    end
    
    def update
        create
    end
    
    private
    def user
        @usuario ||= Usuario.find(params[:usuario_id])
    end
    
    def review_params
        params.require(:review).permit(:points)
    end
end