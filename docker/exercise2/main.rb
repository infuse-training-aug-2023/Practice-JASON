require 'json'
require 'faker'

age = ARGV[0].to_i
ssn = ARGV[1].to_i

exec = ENV['EXEC']

if exec == 'true'
  name = Faker::Name.name
  email = Faker::Internet.email
  phone = Faker::PhoneNumber.phone_number

  data = {
    name: name,
    email: email,
    phone: phone,
    age: age,
    ssn: ssn
  }

  json_data = JSON.generate(data)

  puts json_data
end