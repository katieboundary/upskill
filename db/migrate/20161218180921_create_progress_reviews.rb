class CreateProgressReviews < ActiveRecord::Migration
  def change
    create_table :progress_reviews do |t|
      t.integer :user_id
      t.string :skill_name
      t.text :progress_content

      t.timestamps
    end
  end
end
