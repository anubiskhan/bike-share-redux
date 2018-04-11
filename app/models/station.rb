class Station < ApplicationRecord
  validates_presence_of :name,
                        :dock_count,
                        :city,
                        :installation_date,
                        :lat,
                        :long

  before_save :generate_slug

  def generate_slug
    self.slug = name.parameterize
  end

  def to_param
    slug
  end

  def built
    installation_date.strftime("%B %d, %Y")
  end
end
