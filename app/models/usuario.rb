class Usuario < ActiveRecord::Base
	
	EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

	# Validações
	validates_presence_of :nome, :sobrenome, :idade, :sexo, :email, :senha
	validates_confirmation_of :senha
	validates_inclusion_of :sexo, :in => %w(M F)
	validates_inclusion_of :perfil, :in => %w(O P)
	validates_numericality_of :idade, :greater_than_or_equal_to => 18
	validates_uniqueness_of :email

	validate :email_format

	# Pode ser feita da sequinte forma validates_format_of :email, with: EMAIL_REGEXP
	private
	def email_format
		errors.add(:email, :invalid) unless email.match(EMAIL_REGEXP)
	end
end
