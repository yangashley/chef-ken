class Sale < ApplicationRecord
  before_save :set_cents
  belongs_to :recipe

  validates :sale_price, :volume, presence: true


  def gross_sales
    ['$', self.cents / 100, ".00"].join
  end

  private
  def set_cents
    working_price = self.sale_price.to_s
    if working_price.include?('.')
      working_price.concat('00')
    end
      clean_price = working_price.split('').delete_if{|char| (char =~ /[[:punct:][$][\s]]/)}.join.to_i
      clean_price *= self.volume
      self.cents = clean_price
  end
end
