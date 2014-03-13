class ShortUrl < ActiveRecord::Base
  after_initialize :after_initialize
  def self.generate_hash
    options = [('a'..'z'), ('A'..'Z'), ('0' .. '9')].map { |i| i.to_a }.flatten
    required_chars = Math.log(ShortUrl.count, options.length).ceil + 1

    exists = true;
    while not exists.nil?
      test_hash = (0 .. required_chars).map {options[rand(options.length)]}.join
      exists = ShortUrl.find_by short_url: test_hash
    end
    test_hash

  end

  def after_initialize
    self.short_url = ShortUrl.generate_hash
  end

end
