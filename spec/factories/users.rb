FactoryBot.define do
  factory :user do
    nickname                 {'test'}
    email                    {Faker::Internet.free_email}
    password                 {'aaaa1111'}
    password_confirmation    {password}
    last_name                {'鈴木'}
    first_name               {'太郎'}
    last_name_kana           {'スズキ'}
    first_name_kana          {'タロウ'}
    birthday                 {'2000-06-01'}
  end
end