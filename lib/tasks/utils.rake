namespace :utils do
  desc "Popular DB em desenvolvimento"
  task seed: :environment do
    puts "Gerando tipos de contato (Contact)"
    10.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        kind: Kind.all.sample,
        rmk: Faker::Lorem.paragraph([1,2,3,4,5].sample)
      )
    end
    puts "Contatos gerados"
    puts "------------------------------------------"
    puts "Gerando Endereços (Adressess)"
    Contact.all.each do |contact|
      Address.create!(
        street: Faker::Address.city,
        city: Faker::Address.street_address,
        state: Faker::Address.state_abbr,
        contact: contact
      )
    end
    puts "Endereços gerados"
    puts "------------------------------------------"
    puts "Gerando Telefones (Phones)"
    Contact.all.each do |contact|
      Random.rand(1..5).times do |i|
        Phone.create!(
          phone: Faker::PhoneNumber.phone_number,
          contact: contact
        )
      end
    end
    puts "Telefones gerados"
  end
end
