class User < ApplicationRecord
  has_one  :gender, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      #認証の条件式を変更する
      where(conditions).where(["username = :value", { :value => username }]).first
    else
      where(conditions).first
    end
  end
  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :gender
  belongs_to_active_hash :age
end
