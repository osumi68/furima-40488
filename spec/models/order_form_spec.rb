require 'rails_helper'

RSpec.describe OrderForm, type: :model do
    describe '商品購入記録の保存' do
      before do
        @user = FactoryBot.create(:user)
        @item = FactoryBot.create(:item)
        @order_form = FactoryBot.build(:order_form,user_id: @user.id, item_id: @item.id)
      end
  
      context '内容に問題ない場合' do
        it 'すべての値が正しく入力されていれば購入できること' do
          expect(@order_form).to be_valid
        end
        it '建物名が空でも購入できること' do
          @order_form.building = ''
          expect(@order_form).to be_valid
        end
      end
  
      context '内容に問題がある場合' do
        it '郵便番号は空では保存できないこと' do
          @order_form.post_code = ''
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Post code can't be blank")
        end

        it '郵便番号は『３桁ハイフン４桁』半角英数字でないと保存できないこと' do
          @order_form.post_code = '123-123４'
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Post code is invalid")
        end

        it '都道府県に「---」が選択されている場合は購入できないこと' do
          @order_form.prefecture_id = 1
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Prefecture must be other than 1")
        end

        it '市区町村が空だと購入できないこと' do
          @order_form.city = ''
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("City can't be blank")
        end

        it '番地が空だと購入できないこと' do
          @order_form.street_address = ''
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Street address can't be blank")
        end

        it '電話番号が空だと購入できないこと' do
          @order_form.phone = nil
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Phone can't be blank")
        end

        it '電話番号が9桁以下だと購入できないこと' do
          @order_form.phone = '090123456'
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Phone is invalid")
        end

        it '電話番号が12桁以上だと購入できない' do
          @order_form.phone = '090123456789'
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Phone is invalid")
        end

        it '電話番号が半角数値でないと購入できないこと' do
          @order_form.phone = '０9012341234'
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Phone is invalid")
        end

        it 'tokenが空では購入できないこと' do
          @order_form.token = nil
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Token can't be blank")
        end

        it 'user_idが紐づいていなければ購入できないこと' do
          @order_form.user_id = ''
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("User can't be blank")
        end

        it 'item_idが紐づいていなければ購入できないこと' do
          @order_form.item_id = ''
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Item can't be blank")
        end
      end
    end
  end
