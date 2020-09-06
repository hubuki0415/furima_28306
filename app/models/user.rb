class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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
end