class User < ApplicationRecord
  has_many :user_stocks
  has_many :stocks, through: :user_stocks
  has_many :friendships
  has_many :friends, through: :friendships
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def can_track_stock?(ticker_symbol)
    under_stock_limit? && !stock_already_tracked?(ticker_symbol)
  end

  def under_stock_limit?
    stocks.count < 10
  end

  def stock_already_tracked?(ticker_symbol)
    stock = Stock.check_db(ticker_symbol)
    return false unless stock
    stocks.where(id: stock.id).exists?
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.search_user(param, uid)
    param.strip!
    result = (by_first_name(param, uid) + by_last_name(param, uid) + by_email(param, uid)).uniq
    return nil unless result
    result
  end
  def self.by_first_name(param, uid)
    query('first_name',param, uid)
  end
  def self.by_last_name(param, uid)
    query('last_name',param, uid)
  end
  def self.by_email(param, uid)
    query('email',param, uid)
  end
  def self.query(field, param, uid)
    where("#{field} ILIKE ? AND id != ?","%#{param}%","#{uid}")
  end

  def friends_with?(friend_id)
    self.friends.where(id: friend_id).exists?
  end
end
