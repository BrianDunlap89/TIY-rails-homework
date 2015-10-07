require "hangr/version"
require "hangr/init_db"
require "pry"

module Hangr

  class Player < ActiveRecord::Base
  end

  class Game < ActiveRecord::Base
  end

end

binding.pry
