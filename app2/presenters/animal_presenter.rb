class AnimalPresenter
    delegate :usuario, :name, :specie, :to_param, to: :@animal
    
    def self.model_name
        Animal.model_name
    end
    
    def initialize(animal, context, show_form=true)
        @context = context
        @animal = animal
        @show_form = show_form
    end
    
    def can_review?
        @context.user_signed_in?
    end
    
    def show_form?
        @show_form
    end
    
    def review
        @review ||= @animal.reviews.find_or_initialize_by(usuario_id: @context.current_user.id)
    end
    
    def review_route
        [@animal, review]
    end
    
    def route
        @animal
    end
    
    def review_points
        Review::POINTS
    end
    
    def to_partial_path
        'animal'
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

end