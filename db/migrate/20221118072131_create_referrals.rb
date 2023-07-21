class CreateReferrals < ActiveRecord::Migration[7.0]
  def change
    create_table :referrals do |t|
      t.references :user, null: false, foreign_key: true
      t.string :invitation_email
      t.boolean :is_referal_used
      
      t.timestamps
    end
  end
end
