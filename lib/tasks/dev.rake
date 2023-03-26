namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      puts %x(rails db:drop db:create db:migrate db:seed)
    end
  end
end
