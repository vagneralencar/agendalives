namespace :dev do

  DEFAULT_PASSWORD = 123456
  DEFAULT_FILES_PATH = File.join(Rails.root, 'lib', 'tmp')

  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...") { %x(rails db:drop) }
      show_spinner("Criando BD...") { %x(rails db:create) }
      show_spinner("Migrando BD...") { %x(rails db:migrate) }
      show_spinner("Cadastrando o administrador padrão...") { %x(rails dev:add_default_admin) }
      show_spinner("Cadastrando o administrador extras...") { %x(rails dev:add_default_extra_admin) }
      show_spinner("Cadastrando o usuario padrão...") { %x(rails dev:add_default_user) }
      show_spinner("Cadastrando genereos...") { %x(rails dev:add_genres) }
      show_spinner("Cadastrando artistas...") { %x(rails dev:add_artists) }      
    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end

  desc "Adiciona o administrador padrão"
  task add_default_admin: :environment do
    Admin.create!(
      email: 'vagner@admin.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "Adiciona o administradores extra"
  task add_default_extra_admin: :environment do
    40.times do |i|
    Admin.create!(
      email: Faker::Internet.email,
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
    end
  end


  desc "Adiciona o usuário padrão"
  task add_default_user: :environment do
    User.create!(
      email: 'vagner@user.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "Adiciona generos"
  task add_genres: :environment do
    file_name = 'genres.txt'
    file_path =  File.join(DEFAULT_FILES_PATH, file_name)

    File.open(file_path, 'r').each do |line|
      Genre.create!(description: line.strip)
    end
  end

  desc "Adiciona o Artistas"
  task add_artists: :environment do
    Genre.all.each do |genre| 
      rand(2..5).times do |i|
      Artist.create!(
      name: Faker::Name.name,
      image: 'Link imagem',
      facebook: 'Link facebook',
      instagram: 'Link instagram',
      youtube: 'Link youtube',
      genre: genre
    )
    end    
  end
end

  private 

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")    
  end

end