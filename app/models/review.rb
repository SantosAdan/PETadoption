class Review < ActiveRecord::Base
    POINTS = (1..5).to_a
    belongs_to :reviewer, :class_name => 'Usuario'
    belongs_to :reviewed, :class_name => 'Usuario'
    
    validates_uniqueness_of :reviewer_id, scope: :reviewed_id
    validates_presence_of :points, :reviewer_id, :reviewed_id
    validates_inclusion_of :points, in: POINTS
    
    def self.stars
        (average(:points) || 0).round
    end
end
