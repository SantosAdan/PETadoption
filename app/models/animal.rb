class Animal < ActiveRecord::Base
    extend FriendlyId
    
    belongs_to :usuario
    
    mount_uploader :picture, PictureUploader
    friendly_id :name, use: [:slugged, :history]
    
	validates_presence_of :name, :specie, :slug
	validates_inclusion_of :specie, :in => %w(C D)  
    
    def self.most_recent
        order(created_at: :desc)
    end
end
