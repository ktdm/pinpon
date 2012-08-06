class Suggestion < ActiveRecord::Base
  attr_accessible :relation,
    :suggested_word,
    :apropos_of

  belongs_to :apropos_of,
    :class_name => "Word"
  belongs_to :suggested_word,
    :class_name => "Word"

  validates :relation,
    :presence => true
end
