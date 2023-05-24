require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
    it "nicknameとemail、passwordとpassword_confirmation,first_name,last_name、first_katakana、last_katakana、date_of_birthが存在すれば登録できる" do
      expect(@user).to be_valid
    end
    end
    context '新規登録できないとき' do
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

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    
    it '重複したemailが存在する場合は登録できない' do
      @user.save(validate: false) 
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'last_nameが全角でなければ登録できない' do
      @user.last_name = 'Yamada'  
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
    end

    it 'first_name全角でなければ登録できない' do
      @user.first_name = 'Tarou' 
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end

    it 'first_katakanaが空では登録できない' do
      @user.first_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First katakana can't be blank")
    end

    it 'last_katakanaが空では登録できない' do
      @user.last_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last katakana can't be blank")
    end

    it 'date_of_birthが空では登録できない' do
      @user.date_of_birth = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Date of birth can't be blank")
    end

    it 'first_katakanaが全角カタカナでなければ登録できない' do
      @user.first_katakana = 'やまだ'  
      @user.valid?
      expect(@user.errors.full_messages).to include("First katakana 全角文字を使用してください")
    end

    it 'last_katakanaが全角カタカナでなければ登録できない' do
      @user.last_katakana = 'たろう'  
      @user.valid?
      expect(@user.errors.full_messages).to include("Last katakana 全角文字を使用してください")
    end

    it '英字のみのパスワードでは登録できない' do
      @user.password = 'password' # 英字のみのパスワード
      @user.password_confirmation = 'password'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')
    end

    it '数字のみのパスワードでは登録できない' do
      @user.password = '123456' # 数字のみのパスワード
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')
    end

      it '全角文字を含むパスワードでは登録できない' do
      @user.password = 'パスワード１２３' # 全角文字を含むパスワード
      @user.password_confirmation = 'パスワード１２３'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')
    end
  end
  end
end
