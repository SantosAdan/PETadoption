class UsuariosController < ApplicationController
    before_action :require_no_authentication, only: [:new, :create]
    before_action :can_change, only: [:edit, :update]
    before_action :require_authentication, only: [:destroy]
    
	def new
		@usuario = Usuario.new #Variáveis de instância "@var" são acessíveis pela VIEW
	end

	def create
		@usuario = Usuario.new(user_params)
		if @usuario.save
			redirect_to @usuario, notice: 'Cadastro realizado com sucesso!'
		else
			render action: :new
		end
	end

	def show
        @usuario = Usuario.find(params[:id])
        if user_signed_in?
            @usuario_review = user.reviews.find_or_initialize_by(reviewer_id: current_user.id)
        end
	end

	def edit
		@usuario = Usuario.find(params[:id])
	end

	def update
		@usuario = Usuario.find(params[:id])
		if @usuario.update(user_params)
			redirect_to @usuario, notice: 'Usuário atualizado com sucesso!'
		else
			render action: :edit
		end
	end
    
    def destroy
        @usuario = Usuario.find(params[:id])
        @usuario.destroy
        user_session.destroy
        redirect_to root_path
    end
        
	private

	def user_params
		params.require(:usuario).permit(:nome, :sobrenome, :idade, :sexo, :email, :perfil, :endereco, :telefone, :password, :password_confirmation)
	end
    
    def user
        @user = Usuario.find(params[:id])
    end
    
    def can_change
        unless user_signed_in? && current_user == user
            redirect_to usuario_path(params[:id])
        end
    end
end