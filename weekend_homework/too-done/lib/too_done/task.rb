module TooDone
  class Task < ActiveRecord::Base
    belongs_to :list

    def update_name
      self.update(description: "#{self.description} - Complete")
    end

    def done
      self.update(state: true)
    end

  end
end