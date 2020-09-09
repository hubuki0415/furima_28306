class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
         
         def self.from_omniauth(auth)
          sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
          user = User.where(email: auth.info.email).first_or_initialize(
            nickname: auth.info.name,
              email: auth.info.email
          )
          if user.persisted?
            sns.user = user
            sns.save
          end
          { user: user, sns: sns }
          end
         zennkaku = /\A[ぁ-んァ-ン一-龥]/
         kana = /\A[ァ-ヶー－]+\z/
         hankaku = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
         
         with_options presence: true do
          validates :nickname, format: {with: zennkaku, message: "は全角で入力してください。"}
          validates :first_name, format:  {with: zennkaku, message: "は全角で入力してください。"}
          validates :last_name, format:  {with: zennkaku, message: "は全角で入力してください。"}
          validates :first_name_kana, format:  {with: kana, message: "はカタカナで入力してください。"}
          validates :last_name_kana, format:  {with: kana, message: "はカタカナで入力してください。"}
          validates :birth_day

        end
          validates :password, format: {with: hankaku, message: "は半角英数字も入れてください。"}
          has_many   :items
          has_many   :purchases
          has_many   :sns_credentials
end