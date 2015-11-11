# encoding: utf-8
namespace :app do 
	desc "Encripta todas as senhas que ainda não foram processadas no banco"
	task migrar_senhas: :environment do
		unless Usuario.attribute_names.include? "password"
			puts "As senhas já foram migradas, terminando."
			return
		end

		Usuario.find_each do |usuario|
			puts "Migrando usuário ##{usuario.id} #{usuario.nome}"
			if !usuario.valid? || usuario.attributes["password"].blank?
				puts "Usuário id #{usuario.id} inválido, pulando."
				puts "Corrija-o manualmente e tende novamente.\n\n"
				next
			end

			unencripted_password = usuario.attributes["password"]

			usuario.password = unencripted_password
			usuario.password_confirmation = unencripted_password
			usuario.save!
		end
	end
end