class Measure < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  validates :quantity, :units, :presence => true

  validates :units, inclusion: {in: [
                          'Tbs', 'Cup','Pint',
                          'tsp', 'Quart', 'Gallon',
                          'pound'
                          ]}
  def pretty_print_ammount
  end
end
