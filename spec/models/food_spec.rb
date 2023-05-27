require 'rails_helper'

RSpec.describe Recipe, type: :model do
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

  describe 'attributes' do
    it 'has a name' do
      expect(food.name).to eq('Beans')
    end

    it 'has "grams" as measurement unit' do
      expect(food.measurement_unit).to eq('grams')
    end

    it 'has a price of 10' do
      expect(food.price).to eq(10.0)
    end
  end
end
