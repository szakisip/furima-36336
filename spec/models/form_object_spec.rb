require 'rails_helper'

RSpec.describe FormObject, type: :model do
  before do
    @form_object = FactoryBot.build(:form_object)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@form_object).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @form_object.user_id = 1
        expect(@form_object).to be_valid
      end
      it 'item_idが空でなければ保存できる' do
        @form_object.item_id = 1
        expect(@form_object).to be_valid
      end
      it '郵便番号が「3桁＋ハイフン＋4桁」の組み合わせであれば保存できる' do
        @form_object.postal_code = '123-4560'
        expect(@form_object).to be_valid
      end
      it '都道府県が「---」以外かつ空でなければ保存できる' do
        @form_object.state_id = 1
        expect(@form_object).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @form_object.city = '東村山市'
        expect(@form_object).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @form_object.address1 = '東村山１２３'
        expect(@form_object).to be_valid
      end
      it '建物名が空でも保存できる' do
        @form_object.address2 = nil
        expect(@form_object).to be_valid
      end
      it '電話番号が11番桁以内かつハイフンなしであれば保存できる' do
        @form_object.telnumber = 12345678910
        expect(@form_object).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @form_object.user_id = nil
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @form_object.item_id = nil
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @form_object.postal_code = nil
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid. Include hyphen(-)')
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @form_object.postal_code = 1234567
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '都道府県が「---」だと保存できないこと' do
        @form_object.state_id = 0
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("State must be other than 0")
      end
      it '都道府県が空だと保存できないこと' do
        @form_object.state_id = nil
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("State can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @form_object.city = nil
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @form_object.address1 = nil
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Address1 can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @form_object.telnumber = nil
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Telnumber can't be blank")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @form_object.telnumber = '123 - 1234 - 1234'
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include('Telnumber is invalid')
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @form_object.telnumber = 12_345_678_910_123_111
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include('Telnumber is invalid')
      end
      it 'トークンが空だと保存できないこと' do
        @form_object.token = nil
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end