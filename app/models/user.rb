class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
          validates :nickname, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"}
          validates :first_name, format:  {with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"}
          validates :last_name, format:  {with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"}
          validates :first_name_kana, format:  {with: /\A[ァ-ヶー－]+\z/, message: "はカタカナで入力してください。"}
          validates :last_name_kana, format:  {with: /\A[ァ-ヶー－]+\z/, message: "はカタカナで入力してください。"}
          validates :birth_day

        end
          validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は半角英数字も入れてください。"}
end