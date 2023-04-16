module ApplicationHelper

    def get_locale
        locales = { en: 'Inglês', 'pt-BR': 'Português - Brasil' }
        locales[I18n.locale]
    end
    
    def application_name
        'Crypto Wallet'
    end

    def application_environment
        if Rails.env.development?
            'Desenvolvimento'
        elsif Rails.env.production?
            'Produção'
        else
            'Teste'
        end
    end
end