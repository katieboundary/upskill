class CreateProgressReviews < ActiveRecord::Migration
  def change
    create_table :progress_reviews do |t|
      t.integer :skill_id
      t.text :progress_content

      t.timestamps
    end
  end
end
