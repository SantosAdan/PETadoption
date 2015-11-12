class UsuarioSession
	include ActiveModel::Model

	attr_accessor :email, :password
	validates_presence_of :email, :password

	# Construtor para aceitar os parametros
	def initialize(session, attributes={})
		@session = session
		@email = attributes[:email]
		@password = attributes[:password]
	end

	def authenticate!
		user = Usuario.authenticate(@email, @password)

		if user.present?
			store(user)
		else
			errors.add(:base, :invalid_login)
			false
		end
	end

	def store(user)
		@session[:usuario_id] = user.id
	end

	def current_user
		Usuario.find(@session[:usuario_id])
	end

	def user_signed_in?
		@session[:usuario_id].present?
	end

	def destroy
		@session[:usuario_id] = nil
	end
end