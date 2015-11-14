class Animal < ActiveRecord::Base
    belongs_to :usuario
    
	validates_presence_of :name, :specie
	validates_inclusion_of :specie, :in => %w(C D)
end
