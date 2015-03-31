class Author < ActiveRecord::Base
  has_secure_password

  belongs_to :tenant
  has_many :articles

  def self.generate_samples(count)
    count.times do
      Fabricate(:author)
      yield if block_given?
    end
  end

  def self.random
    order('RANDOM()').limit(1).first
  end
end
