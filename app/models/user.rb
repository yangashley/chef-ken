class User < ApplicationRecord
  has_secure_password

  validates :name, :email, presence: true
  validates :email, uniqueness: true

  validate :there_can_only_be_one

  def there_can_only_be_one
    unless !User.exists?(is_ken: true)
      unless !self.is_ken
        errors.add(:highlander, 'There can be only one!')
      end
    end
  end
end
