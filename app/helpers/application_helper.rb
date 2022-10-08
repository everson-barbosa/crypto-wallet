module ApplicationHelper
    def date_to_br(date)
        date.strftime('%d/%m/%Y')
    end

    def application_name
        'Crypto Wallet'
    end
end
