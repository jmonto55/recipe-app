require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:user) { User.new(name: 'Tom', email: 'tom@mail.com') }

  let(:food) do
    Food.create(
      name: 'Beans',
      measurement_unit: 'grams',
      price: 10.0,
      quantity: 500,
      user_id: user.id
    )
  end
end
