require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  
  describe "ユーザー新規登録" do
    context '新規登録できる場合' do
      it "全ての項目が入力されていれば登録できる" do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = '12345a'
        @user.password_confirmation = '12345a'
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailが@を含まなければ登録できないこと" do
        @user.email = 'testsample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "emailが一意性でないと登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email:@user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが英語のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが全角では登録できない' do
        @user.password = '１２３ｂｃｄ'
        @user.password_confirmation = '１２３ｂｃｄ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordとpassword_confirmationが不一致では登録できない" do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameは全角漢字・平仮名・カタカナ以外では登録できない" do
        @user.last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameは全角漢字・平仮名・カタカナ以外では登録できない" do
        @user.first_name = 'bbb'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_renameが空だと登録できない" do
        @user.last_rename = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last rename can't be blank")
      end
      it "last_renameは全角カタカナ以外では登録できない" do
        @user.last_rename = 'ｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last rename is invalid")
      end
      it "first_renameが空だと登録できない" do
        @user.first_rename = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First rename can't be blank")
      end
      it "first_renameは全角カタカナ以外では登録できない" do
        @user.first_rename = 'ｲｲｲ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First rename is invalid")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end