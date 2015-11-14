class UsuarioSessionsController < ApplicationController
    before_action :require_no_authentication, only: [:new, :create]
    before_action :require_authentication, only: :destroy
    
	def new
		@usuario_session = UsuarioSession.new(session)
	end

	def create
		@usuario_session = UsuarioSession.new(session, params[:usuario_session])
		if @usuario_session.authenticate!
			redirect_to root_path, notice: t('flash.notice.signed_in')
		else
			render :new
		end
	end

	def destroy
		user_session.destroy
		redirect_to root_path, notice: t('flash.notice.signed_out')
	end
end