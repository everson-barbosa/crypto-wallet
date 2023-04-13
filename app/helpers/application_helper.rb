module ApplicationHelper
    
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