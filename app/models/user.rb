class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
          validates :nickname

          PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
          validates_format_of :password, with: PASSWORD_REGEX, message: '英字と数字の両方を含めて設定してください'
      
          with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角ひらがな、全角カタカナ、漢字で入力して下さい." } do
            validates :last_name
            validates :first_name
          end
      
          with_options format: {with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナで入力して下さい." } do
            validates :last_name_kana
            validates :first_name_kana
          end
      
          validates :birthday
        end
end
