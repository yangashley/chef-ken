class Measure < ApplicationRecord
  belongs_to :recipe
  # belongs_to :ingredient
  validates :quantity, :presence => true

  validates :units, inclusion: {in: [
                          'Tbs', 'Cup','Pint',
                          'tsp', 'Quart', 'Gallon',
                          'pound'
                          ]}
  def pretty_print_ammount
    unless ["Tbs", "tsp"].include?(self.units) || self.quantity == '1' || self.quantity.start_with?("1/")
      u_of_measure = [self.units, 's'].join
    else
      u_of_measure = self.units
    end
    "#{self.quantity} #{u_of_measure} of #{self.ingredient}"
  end
end
