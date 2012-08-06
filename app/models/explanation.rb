class UriValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    raise URI::InvalidURIError unless URI.parse(value).scheme.in? ["http", "https"]
  rescue URI::InvalidURIError
    record.errors.add attribute, "Invalid URI"
  end
end

class Explanation < ActiveRecord::Base
  include ActiveModel::Validations

  attr_accessible :body,
    :example,
    :upvotes,
    :downvotes

  belongs_to :equivalence

  validates :example,
    :presence => true,
    :uri => true
end
