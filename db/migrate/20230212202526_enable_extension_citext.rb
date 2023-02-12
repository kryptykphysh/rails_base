# EnableExtensionCitext allows case insensitive text fields
class EnableExtensionCitext < ActiveRecord::Migration[7.0]
  def up
    enable_extension "citext" unless extensions.include? "citext"
  end

  def down
    disable_extension "citext" if extensions.include? "citext"
  end
end
