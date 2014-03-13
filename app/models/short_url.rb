class ShortUrl < ActiveRecord::Base

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
end
