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
    
    def route
        @animal
    end
    
    def show_form?
        @show_form
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