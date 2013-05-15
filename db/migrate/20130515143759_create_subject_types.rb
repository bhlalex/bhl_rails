class CreateSubjectTypes < ActiveRecord::Migration
  def change
    create_table :subject_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
