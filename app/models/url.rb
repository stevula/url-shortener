class Url < ActiveRecord::Base
  # Remember to create a migration!
  before_save :generate_short_url
  validates :long_url, presence: true
  validates :long_url, format: { with: URI.regexp }

  def update_click_count
    self.click_count += 1
    self.save
  end

  def generate_short_url
    if self.short_url.nil?
      self.short_url =(0...5).map { ('a'..'z').to_a[rand(26)] }.join
    end
  end

end
