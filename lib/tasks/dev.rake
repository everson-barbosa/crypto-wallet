namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando banco de dados", "Apagado com sucesso") do
        %x(rails db:drop)
      end

      show_spinner("Criando banco de dados", "Criado com sucesso") do
        %x(rails db:create)
      end

      show_spinner("Migrand banco de dados", "Migrado com sucesso") do
        %x(rails db:migrate)
      end

      show_spinner("Populando banco de dados", "Populado com sucesso") do
        %x(rails db:seed)
      end
    else
      puts "Você não está em ambiente de desenvolvimento"
    end
  end

  def show_spinner(msg_start, msg_end) 
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}...")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end}!)")
  end
end
