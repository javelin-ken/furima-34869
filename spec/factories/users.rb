FactoryBot.define do
  factory :user do
    nickname              {"tarou"}
    email                 {"sample@yahoo.co.jp"}
    password              {"tarou123"}
    password_confirmation {"tarou123"}
    lastname_kanji        {"山田"}
    firstname_kanji       {"太郎"}
    lastname_katakana     {"ヤマダ"}
    firstname_katakana    {"タロウ"}
    birthday              {"1985-9-23"}
  end
end 