class Sale < ApplicationRecord
  before_save :set_cents
  belongs_to :recipe

  validates :sale_price, :volume, presence: true


  def gross_sales
    self.cents.dup.insert(-2, '.').insert(0, '$')
  end

  private
  def set_cents
    working_price = self.sale_price
    raise working_price.inspect
    unless working_price.include?('.')
      working_price.concat('00')
    end
      clean_price = working_price.split('').delete_if{|char| (char =~ /[[:punct:][$][\s]]/)}.join
      clean_price.to_i *= self.volume
      self.cents = clean_price.to_s
  end
end
