module Popolo
  module ConfigurableMongoid
    def configure_mongoid
      store_in session: Popolo.session, database: Popolo.database
    end
  end
end
