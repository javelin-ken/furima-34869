require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail,passwordとpassword_confirmation,lastname_kanjiとfirstname_kanji,lastname_katakanaとfirstname_katakana,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      
      it 'passwordとpassword_confirmationが英数字混合の6文字以上であれば登録できる' do
        @user.password = "aaa000"
        @user.password_confirmation = "aaa000"
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailが重複している場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
  

      it 'emailに@が含まれていない場合登録できない' do
        @user.email = 'test.co.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end

      it 'passwordが存在していてもpassword_confirmationが空では登録できない' do
        @user.password = 'aaa000'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが5文字以下の場合登録できない' do
        @user.password = 'aaa00'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'passwordが英字だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end

      it 'passwordが数字だけでは登録できない' do
          @user.password = '000000'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end

      it 'passwordが全角では登録できない' do
        @user.password = 'ｑｑｑ１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end

      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        @user.password = 'aaa000'
        @user.password_confirmation = 'aaa111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'lastname_kanjiが空では登録できない' do
        @user.lastname_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kanji can't be blank")
      end

      it 'lastname_kanjiが半角では登録できない' do
        @user.lastname_kanji = 'ｵｵﾀﾆ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kanji Full-width characters")
      end

      it 'firstname_kanjiが空では登録できない' do
        @user.firstname_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kanji can't be blank")
      end

      it 'firstname_kanjiが半角では登録できない' do
        @user.firstname_kanji = 'ｹﾝｾｲ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kanji Full-width characters")
      end

      
      it 'lastname_katakanaが空では登録できない' do
        @user.lastname_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname katakana can't be blank")
      end

      it 'lastname_katakanaが半角カタカナでは登録できない' do
        @user.lastname_katakana = 'ｵｵﾀﾆ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname katakana Full-width katakana characters")
      end

      it 'lastname_katakanaが全角ひらがなでは登録できない' do
        @user.lastname_katakana = 'おおたに'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname katakana Full-width katakana characters")
      end

      it 'lastname_katakanaが全角英字では登録できない' do
        @user.lastname_katakana = 'ｑｑｑｑ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname katakana Full-width katakana characters")
      end

      it 'lastname_katakanaが全角数字では登録できない' do
        @user.lastname_katakana = '１１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname katakana Full-width katakana characters")
      end

      it 'firstname_katakanaが空では登録できない' do
        @user.firstname_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname katakana can't be blank")
      end

      it 'firstname_katakanaが半角カタカナでは登録できない' do
        @user.firstname_katakana = 'ｹﾝｾｲ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname katakana Full-width katakana characters")
      end

      it 'firstname_katakanaが全角ひらがなでは登録できない' do
        @user.firstname_katakana = 'けんせい'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname katakana Full-width katakana characters")
      end

      it 'firstname_katakanaが全角英字では登録できない' do
        @user.firstname_katakana = 'ｑｑｑｑ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname katakana Full-width katakana characters")
      end

      it 'firstname_katakanaが全角数字では登録できない' do
        @user.firstname_katakana = '１１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname katakana Full-width katakana characters")
      end


      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
