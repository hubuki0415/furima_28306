require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザーの新規登録がうまくいくこと' do
      it "ニックネーム、メールアドレス、パスワード、パスワード（確認）、苗字、名前、苗字（カナ）、名前（カナ）、誕生日があれば登録できる" do
      
      expect(@user).to be_valid
      end
    end

    it "ニックネームが必須であること" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "メールアドレスが必須であること" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "メールアドレスは一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "メールアドレスに@を含む必要があること" do
      @user.email = "k.gmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "パスワードが必須であること" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "パスワードが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "パスワードが6文字以上であれば登録できること" do
      @user.password = "123456a"
      @user.password_confirmation = "123456a"
      expect(@user).to be_valid
    end

    it "パスワードは半角英数字混合であること" do
      @user.password = "１２３４５６"
      @user.password_confirmation = "１２３４５６"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は半角英数字も入れてください。")
    end

    it "パスワードは確認用を含めて二回入力すること" do
      @user.password = "abcdef"
      @user.password_confirmation = "vvvvvvvv"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "ユーザー本名で、苗字が必須であること" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "ユーザー本名で、名前が必須であること" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "ユーザー本名(苗字)が、(漢字・ひらがな・カタカナ）で入力させること" do
      @user.first_name = "123"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name は全角で入力してください。")
    end

    it "ユーザー本名(名前)が、(漢字・ひらがな・カタカナ）で入力させること" do
      @user.last_name = "123"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name は全角で入力してください。")
    end

    it "ユーザー本名のフリガナが、苗字が必須であること" do
      @user.first_name_kana =nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "ユーザー本名のフリガナが、名前が必須であること" do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "ユーザー本名(苗字)のフリガナは全角（カタカナ）で入力させること" do
    @user.first_name_kana = "123"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana はカタカナで入力してください。")
    end

    it "ユーザー本名(苗字)のフリガナは全角（カタカナ）で入力させること" do
      @user.last_name_kana = "123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana はカタカナで入力してください。")
    end
      
    it "誕生日が必須であること" do
      @user.birth_day = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end

 end
end