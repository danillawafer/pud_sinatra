require 'spec_helper'
require_relative '../app/models/game'

describe "Game" do


  before(:all) do
    raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Migrator.current_version > 0
  end

  it "Should have a 'games' table" do
    ActiveRecord::Base.connection.table_exists?(:games).should be_true
  end

  it "'games' table should have the right columns and types" do
    expected = {
      :integer => ["id","duration"],
      :string => ["winner"],
      :datetime => ["created_at", "updated_at"]
    }

    ActiveRecord::Base.connection.columns(:games).each do |col|
      expected[col.type].include?(col.name).should be_true
    end
  end


end