# EnableExtensionPgcrypto allows for uuid generating functions
class EnableExtensionPgcrypto < ActiveRecord::Migration[7.0]
  def up
    enable_extension "pgcrypto" unless extensions.include? "pgcrypto"
  end

  def down
    disable_extension "pgcrypto" if extensions.include? "pgcrypto"
  end
end
