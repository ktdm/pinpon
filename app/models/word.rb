class Word < ActiveRecord::Base
  attr_accessible :value,
    :language,
    :upvotes,
    :downvotes,
    :eqivalences,
    :suggestions

  has_many :equivalences,
    :foreign_key => :source_word_id
#  has_many :translations,
#    :through => :equivalences,
#    :source => :source_word,
#    :class_name => "Word"
  has_many :suggestions,
    :foreign_key => :apropos_of_id

  validates :value,
    :presence => true
  validates :language,
    :presence => true

  before_save "language.capitalize!"
end
