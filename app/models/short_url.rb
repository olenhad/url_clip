class ShortUrl < ActiveRecord::Base
  before_save :setup_url
  VALID_URL_REGEX = /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/
  validates :original_url, presence: true, format: {with: VALID_URL_REGEX}
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

  def setup_url
    self.short_url = ShortUrl.generate_hash
  end

end
