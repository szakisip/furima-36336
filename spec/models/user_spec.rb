require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
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
    it "passwordが空だと登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    # it 'passwordが5文字以下であれば登録できない' do
    #   @user.nickname = 'aaaaaa'
    #   @user.valid?
    #   binding.pry
    #   expect(@user.errors.full_messages).to include("Nickname can't be blank")
    # end
    # it "passwordとpassword_confirmationが不一致では登録できない" do
    #   @user.nickname = ''
    #   @user.valid?
    #   expect(@user.errors.full_messages).to include("Nickname can't be blank")
    # end
    it "last_nameが空だと登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "first_nameが空だと登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "last_renameが空だと登録できない" do
      @user.last_rename = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last rename can't be blank")
    end
    it "first_renameが空だと登録できない" do
      @user.first_rename = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First rename can't be blank")
    end
    it "birthdayが空だと登録できない" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
  end
end

#   "Password can't be blank",
#   "Last name can't be blank",
#   "First name can't be blank",
#   "Last rename can't be blank",
#   "First rename can't be blank",
#   "Birthday can't be blank"]
