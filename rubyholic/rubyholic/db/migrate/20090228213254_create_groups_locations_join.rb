class CreateGroupsLocationsJoin < ActiveRecord::Migration
  def self.up
    create_table 'groups_locations', :id => false do |t|
      t.column 'group_id', :integer
      t.column 'location_id', :integer
    end
  end

  def self.down
    drop_table 'groups_locations'
  end
end
