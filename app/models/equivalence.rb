class Equivalence < ActiveRecord::Base
  attr_accessible :source_word,
    :target_word,
    :explanations,
    :upvotes,
    :downvotes

  belongs_to :source_word,
    :class_name => "Word"
  belongs_to :target_word,
    :class_name => "Word"

  has_many :explanations

  accepts_nested_attributes_for :source_word
  accepts_nested_attributes_for :target_word
  accepts_nested_attributes_for :explanations
end
