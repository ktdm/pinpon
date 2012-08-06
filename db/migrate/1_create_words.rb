class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :value, :null => false
      t.string :language, :null => false
      t.integer :upvotes, :default => 0
      t.integer :downvotes, :default => 0
 
      t.timestamps
    end
    add_index :words, [:value, :language], :unique => true

    create_table :equivalences do |t|
      t.references :source_word
      t.references :target_word
      t.integer :upvotes, :default => 0
      t.integer :downvotes, :default => 0
 
      t.timestamps
    end

    create_table :explanations do |t|
      t.references :equivalence
      t.text :body
      t.text :example, :null => false
      t.integer :upvotes, :default => 0
      t.integer :downvotes, :default => 0
 
      t.timestamps
    end
    add_index :explanations, :equivalence_id

    create_table :suggestions do |t|
      t.references :apropos_of
      t.references :suggested_word
      t.string :relation, :null => false
      t.integer :upvotes, :default => 0
      t.integer :downvotes, :default => 0
 
      t.timestamps
    end
    add_index :suggestions, :apropos_of_id

    create_table :languages do |t|
      t.string :name, :null => false
 
      t.timestamps
    end

    create_table :relations do |t|
      t.string :name, :null => false
 
      t.timestamps
    end
  end
end
