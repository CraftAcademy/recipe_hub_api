RSpec.describe Ingredient::ShowSerializer, type: :serializer do
  let!(:recipe) { create(:recipe, name: 'Pancakes', instructions: 'Mix it') }
  let!(:ingredient) { create(:ingredient) }

  let!(:ingredients) do
    create(:recipe_ingredient, recipe: recipe, ingredient: ingredient, amount: 6, unit: 'dl')
  end

  let!(:serialization) do
    ActiveModelSerializers::SerializableResource.new(ingredients, serializer: described_class)
  end

  subject { JSON.parse(serialization.to_json) }

  it 'is expected to wrap data in a key reflecting the resource name' do
    expect(subject.keys).to match ['recipe_ingredient']
  end

  it 'is expected to contain keys with specific data types' do
    expect(subject).to match(
      'recipe_ingredient' => {
        'name' => an_instance_of(String),
        'amount' => an_instance_of(Float),
        'unit' => an_instance_of(String)
      }
    )
  end
end
