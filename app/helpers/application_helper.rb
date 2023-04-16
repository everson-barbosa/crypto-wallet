module ApplicationHelper

    def get_locale(locate)
        locales = { en: 'Inglês', 'pt-BR': 'Português - Brasil' }
        locales[locale]
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