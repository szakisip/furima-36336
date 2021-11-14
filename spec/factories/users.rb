FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'a00000'}
    password_confirmation {password}
    last_name             {'名字'}
    first_name            {'名前'}
    last_rename           {'ミョウジ'}
    first_rename          {'ナマエ'}
    birthday              {'20210101'}
  end
end
