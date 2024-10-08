class AddRsvpToGuests < ActiveRecord::Migration[7.1]
  def change
    add_column :guests, :rsvp, :boolean
  end
end
