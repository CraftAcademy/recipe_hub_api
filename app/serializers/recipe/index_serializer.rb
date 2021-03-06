class Recipe::IndexSerializer < ActiveModel::Serializer
  attributes :id, :image, :name, :lede, :instructions, :created_at, :updated_at, :user, :forks_count

  def created_at
    object.created_at.to_formatted_s(:long)
  end

  def updated_at
    object.created_at.to_formatted_s(:long)
  end

  def user
    object.user.email
  end

  def image
    object.image_serialized
  end

  def lede
    object.instructions[0, 100]
  end
end
