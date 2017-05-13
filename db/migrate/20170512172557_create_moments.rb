class CreateMoments < ActiveRecord::Migration[5.0]
  def change
    create_table :moments do |t|
      t.references :user, :null=>true
      t.string :phone
      t.string :body
      t.string :twilio_id

      t.timestamps
    end
  end
end
