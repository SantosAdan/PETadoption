class Review < ActiveRecord::Base
    POINTS = (1..5).to_a
    
    belongs_to :usuario
    belongs_to :animal, counter_cache: true
    
    validates_uniqueness_of :usuario_id, scope: :animal_id
    validates_presence_of :usuario_id, :animal_id, :points
    validates_inclusion_of :points, in: POINTS
end
