class Notifications < ActionMailer::Base
    default from: 'no-replay@petadoption.com'
    
    def adoption(animal, usuario)
        @animal = animal
        @adopter = usuario
    
        mail({
            to: usuario.email,
            bcc: ['notifications <notifications@petadoption.com>'],
            subject: I18n.t('notification.adoption.subject')
        })
    end
end