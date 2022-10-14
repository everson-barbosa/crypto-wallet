module ApplicationHelper
    def date_to_br(date)
        date.strftime('%d/%m/%Y')
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