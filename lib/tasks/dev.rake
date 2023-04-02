namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando banco de dados") { %x(rails db:drop) }
      show_spinner("Criando banco de dados") { %x(rails db:create) }
      show_spinner("Migrand banco de dados") { %x(rails db:migrate) }
      %x(rails dev:add_coins)
      %x(rails dev:add_mining_types)
    else
      puts "Você não está em ambiente de desenvolvimento"
    end
  end

  desc "Cadastra as moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando moedas...") do
      coins = [
        {
          description: 'Bitcoin',
          acronym: 'BTC',
          url_image: 'https://cdn-icons-png.flaticon.com/512/6943/6943101.png'
        },
        {
          description: 'Ethereum',
          acronym: 'ETH',
          url_image: 'https://cdn-icons-png.flaticon.com/512/6943/6943137.png'
        },
        {
          description: 'Dash',
          acronym: 'DASH',
          url_image: 'https://cdn-icons-png.flaticon.com/512/6943/6943131.png'
        }
      ]

    coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Cadastra os tipos de mineiração"
  task add_mining_types: :environment do
    show_spinner("Cadastrando tipos de mineiração...") do
      mining_types = [
        {
          name: "Proof of Work",
          acronym: "PoW",
        },
        {
          name: "Proof of Stake",
          acronym: "PoS"
        }
      ]
    mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  def show_spinner(msg_start) 
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}...")
    spinner.auto_spin
    yield
    spinner.success("Concluído com sucesso!")
  end
end
