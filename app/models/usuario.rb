class Usuario < ActiveRecord::Base
	
	EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

	# Validações
	validates_presence_of :nome, :sobrenome, :idade, :sexo, :email
	validates_inclusion_of :sexo, :in => %w(M F)
	validates_inclusion_of :perfil, :in => %w(O P)
	validates_numericality_of :idade, :greater_than_or_equal_to => 18
	validates_uniqueness_of :email

	validate :email_format

	has_secure_password

	def nome_completo
		"#{nome} #{sobrenome}"
	end

	def self.authenticate(email, password)
		usuario = find_by(email: email)
		if usuario.present?
			usuario.authenticate(password)
		end
	end

	private
	# Pode ser feita da sequinte forma validates_format_of :email, with: EMAIL_REGEXP
	def email_format
		errors.add(:email, :invalid) unless email.match(EMAIL_REGEXP)
	end
end
