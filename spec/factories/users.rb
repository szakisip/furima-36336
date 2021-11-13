FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    last_name             {'test'}
    first_name            {'test'}
    last_rename           {'test'}
    first_rename          {'test'}
    birthday              {'20210101'}
  end
end
