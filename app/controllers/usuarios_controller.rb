class UsuariosController < ApplicationController
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

	private

	def user_params
		params.require(:usuario).permit(:nome, :sobrenome, :idade, :sexo, :email, :perfil, :endereco, :telefone, :password, :password_confirmation)
	end
end