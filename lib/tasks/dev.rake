namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando banco de dados") { %x(rails db:drop) }
      show_spinner("Criando banco de dados") { %x(rails db:create) }
      show_spinner("Migrand banco de dados") { %x(rails db:migrate) }
      show_spinner("Populando banco de dados") { %x(rails db:seed) }
    else
      puts "Você não está em ambiente de desenvolvimento"
    end
  end

  def show_spinner(msg_start) 
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}...")
    spinner.auto_spin
    yield
    spinner.success("Concluído com sucesso!")
  end
end
